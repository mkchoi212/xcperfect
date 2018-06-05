require 'xcperfect/bar'
require 'xcperfect/version'
require 'xcperfect/printer'
require 'xcperfect/parser'
require 'xcperfect/syntax'
require 'xcperfect/ansi'
require 'xcperfect/formatters/formatter'
require 'xcperfect/formatters/all'
require 'xcperfect/formatters/simple'

include XCPerfect::ANSI

# XCPerfect contains class level functions
module XCPerfect
  def self.exit_with_error(message, colorize)
    @colorize = colorize
    $stderr.puts red("xcperfect: #{message}")
    exit 1
  end
end
