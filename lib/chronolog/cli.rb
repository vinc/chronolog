require "readline"

module Chronolog
  class CLI
    CLI_CMDS = %w[quit help].freeze
    LIB_CMDS = %w[print start started stop stopped].freeze
    CMDS = (CLI_CMDS + LIB_CMDS).sort.freeze

    def initialize(path)
      @interactive = false
      raise usage if path.nil?
      @chronolog = Chronolog::Engine.new(File.open(path, "a+"))
    end

    def run(cmd)
      if cmd.empty?
        @interactive = true
        comp = proc { |s| CMDS.grep(/^#{Regexp.escape(s)}/) }
        Readline.completion_append_character = ""
        Readline.completion_proc = comp
        exec(cmd) while (cmd = Readline.readline("> ", true))
      else
        exec(cmd)
      end
    rescue Interrupt
      exit
    end

    protected

    def exec(cmd)
      exit if cmd =~ /^q/
      args = cmd.split
      name = args.shift
      return usage unless LIB_CMDS.include?(name)
      @chronolog.send(name, **parse(args))
    rescue StandardError => e
      puts "Error: #{e.message}"
    end

    def parse(args)
      key = :time
      args.each_with_object({}) do |arg, opts|
        case arg
        when "at", "on", "for"
          key = :time
        when "in"
          key = :unit
        else
          opts[key] = "#{opts[key]} #{arg}".lstrip if key
        end
      end
    end

    def usage
      unless @interactive
        puts "Usage: chronolog <file.log> [command]"
        puts
      end
      commands = (@interactive ? CMDS : LIB_CMDS).join("', '")
      puts "Available commands: '#{commands}'"
    end
  end
end
