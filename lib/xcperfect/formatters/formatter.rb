require 'xcperfect/ansi'
require 'xcperfect/parser'

module XCPerfect
  class Formatter
    include ANSI

    attr_reader :parser

    def initialize(use_ascii, colorize, json)
      @use_ascii = use_ascii
      @colorize = colorize
      @parser = Parser.new(json)
    end

    def pretty_format(targets)
      puts @json
    end
  end
end
