require 'xcperfect/ansi'

module XCPerfect
  # Bar is a "progress bar" that is used to represent
  # the code coverage percentage
  class Bar
    BLOCK = '█'.freeze
    BLOCK_ASCII = '#'.freeze
    extend ANSI

    def self.create(percentage, bar_length, color, ascii)
      @colorize = color
      block_symbol = ascii ? BLOCK_ASCII : BLOCK

      progress_length = (bar_length * percentage).round
      filled = block_symbol * progress_length
      remaining = red('-' * (bar_length - progress_length))

      color_func = color_for(percentage)
      bar = color_func.call(filled) + remaining
      "|#{bar}| #{percentage * 100} %"
    end
  end
end
