require 'xcperfect/version'
require 'xcperfect/printer'
require 'xcperfect/parser'
require 'xcperfect/syntax'
require 'xcperfect/formatters/formatter'
require 'xcperfect/formatters/all'
require 'xcperfect/formatters/simple'

# XCPerfect contains class level functions
module XCPerfect
  def self.exit_with_error(message)
    $stderr.puts "[!] #{message}"
    exit 1
  end
end
