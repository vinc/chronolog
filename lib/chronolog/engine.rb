require "csv"
require "chronic"
require "rainbow"

module Chronolog
  class Engine
    def initialize(file)
      @csv = CSV.new(file, col_sep: " ")

      setup_variables
      read_csv
    end

    def start(time: "now")
      raise "Received 'start' after 'start'" unless @started_at.nil?
      @started_at = Chronic.parse(time)
      @csv << ["started", "at", @started_at.to_i]
    end

    def stop(time: "now")
      raise "Received 'stop' before 'start'" if @started_at.nil?
      @stopped_at = Chronic.parse(time)
      @csv << ["stopped", "at", @stopped_at.to_i]
      update_variables
      @started_at = nil
    end

    def print(unit: "hours", time: "now")
      stopped_at = Chronic.parse(time)
      started_at = @started_at || stopped_at
      current = stopped_at - started_at
      header = format("Time logged for %s", stopped_at.strftime("%F"))
      puts Rainbow(header).yellow
      %w[year month day session].each do |period|
        next if period == "session" && time != "now"
        duration = (current + previous(period, started_at)) / unit_length(unit)
        left = Rainbow(format("%- 10s", "#{period.capitalize}:"))
        right = Rainbow(format("% 9.2f %s", duration, unit)).cyan
        puts "#{left} #{right}"
      end
    end

    alias started start
    alias stopped stop

    protected

    def setup_variables
      @years = Hash.new(0)
      @months = Hash.new(0)
      @days = Hash.new(0)
      @csv.rewind
    end

    def read_csv
      @csv.each do |row|
        timestamp = row[2].to_i
        case row[0]
        when "started"
          @started_at = Time.at(timestamp)
        when "stopped"
          @stopped_at = Time.at(timestamp)
          raise "Found a 'stop' without a 'start'" if @started_at.nil?
          raise "Found a 'stop' before a 'start'" if @started_at > @stopped_at
          update_variables
          @started_at = nil
        end
      end
    end

    def update_variables
      duration = @stopped_at - @started_at
      @years[@started_at.year] += duration
      @months[@started_at.month] += duration
      @days[@started_at.day] += duration
    end

    def previous(period, started_at)
      return 0 if period == "session"
      h = instance_variable_get("@#{period}s")
      k = started_at.send(period)
      h.fetch(k, 0)
    end

    def unit_length(unit)
      case unit
      when "seconds"
        1.0
      when "kiloseconds"
        1000.0
      when "hours"
        3600.0
      when "days"
        86400.0
      when "centidays"
        864.0
      else
        raise "Unsupported time unit"
      end
    end
  end
end
