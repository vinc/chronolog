require "readline"

module Chronolog
  class CLI
    CLI_CMDS = %w[quit help].freeze
    LIB_CMDS = %w[print start stop].freeze
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
      args = cmd.split
      exit if cmd =~ /^q/
      return @chronolog.send(args.shift, *args) if LIB_CMDS.include?(args[0])
      usage
    rescue StandardError => e
      puts "Error: #{e.message}"
    end

    def usage
      unless @interactive
        puts "Usage: chronolog [command] <file.log>"
        puts
      end
      commands = (@interactive ? CMDS : LIB_CMDS).join("', '")
      puts "Available commands: '#{commands}'"
    end
  end
end
