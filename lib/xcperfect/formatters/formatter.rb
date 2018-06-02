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

    def pretty_format(___)
      puts @json
    end

    def color_percentage(percentage)
      percent_str = percentage.to_s + ' %'

      case percentage.round
      when 0..33
        red(percent_str)
      when 33...66
        orange(percent_str)
      when 66..100
        green(percent_str)
      else
        raise "Percentage of #{percentage} is not possible :("
      end
    end

    def align_formats(arrays)
      column_sizes = arrays.map(&:length)
      common_column_size = column_sizes[0]

      (0...common_column_size).map do |column|
        width = arrays.map { |row| strip(row[column]).length }.max
        (width * 1.5).round
      end
    end

    def align(arrays)
      widths = align_formats(arrays)
      arrays.map do |row|
        row.each_with_index.map do |column, idx|
          column.ljust(widths[idx])
        end
      end
    end
  end
end
