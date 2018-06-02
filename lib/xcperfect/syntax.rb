# Credit to xcpretty
# https://github.com/supermarin/xcpretty/blob/a770f152903f4eb672f5bae0a7fa6ecc4e35b397/lib/xcpretty/syntax.rb

begin
  require 'rouge'
rescue LoadError
  # rubocop:disable Style/ConstantName
  Rouge = nil
  # rubocop:enable Style/ConstantName
end

require 'xcpretty/snippet'

module XCPerfect
  # Syntax highlights the function signatures displayed to the user
  # while using the `all.rb` formatter
  module Syntax
    def self.highlight(filename, line)
      return signature unless Rouge
      highlight_with_formatter(filename, line, Rouge::Formatters::Terminal256.new)
    end

    def self.highlight_with_formatter(filename, line, formatter)
      lexer = find_lexer(filename, line)
      if lexer
        formatter.format(lexer.lex(line)).rstrip
      else
        line
      end
    end

    # @param [String] filename The filename
    # @param String line of code to be highlighted
    # @return [Rouge::Lexer]
    def self.find_lexer(filename, line)
      case File.extname(filename)
      when '.cpp', '.cc', '.c++', '.cxx', '.hpp', '.h++', '.hxx'
        Rouge::Lexers::Cpp
      when '.m', '.h' then Rouge::Lexers::ObjectiveC
      when '.swift' then Rouge::Lexers::Swift
      when '.ruby', '.rb' then Rouge::Lexers::Ruby
      else
        options = {
          filename: File.basename(filename),
          source: line
        }
        Rouge::Lexer.guesses(options).first
      end
    end
  end
end
