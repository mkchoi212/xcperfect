module XCPerfect
  # Printer handles the initialization of the output formatter
  # and is directly called by the main `xcperfect` file during execution
  class Printer
    attr_reader :formatter

    def initialize(params, json)
      klass = params[:formatter]
      @formatter = klass.new(params[:ascii], params[:colorize], json)
    end

    def pretty_print(targets)
      formatted_text = formatter.pretty_format(targets)
      STDOUT.print(formatted_text + "\n")
      STDOUT.flush
    end
  end
end
