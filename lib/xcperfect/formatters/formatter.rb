require 'xcperfect/ansi'
require 'xcperfect/parser'

module XCPerfect
  class Formatter
    include ANSI

    attr_reader :parser

    def initialize(use_unicode, colorize, json)
      @use_unicode = use_unicode
      @colorize = colorize
      @parser = Parser.new(json)
    end

    def pretty_format(text, schemes)
      puts text
    end
  end
end
