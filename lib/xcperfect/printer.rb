require 'xcperfect/ansi'

module XCPerfect
  class Printer
    attr_reader :formatter

    def initialize(params, json)
      klass = params[:formatter]
      @formatter = klass.new(params[:ascii], params[:colorize], json)
    end

    def pretty_print(targets)
      formatted_text = formatter.pretty_format(targets)
      unless formatted_text == ''
        STDOUT.print(formatted_text)
        STDOUT.flush
      end
    end
  end
end
