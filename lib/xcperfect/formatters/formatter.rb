require 'xcperfect/ansi'
require 'xcperfect/bar'
require 'xcperfect/parser'

module XCPerfect
  # Formatter is the base adopted by `all.rb` and `simple.rb`
  class Formatter
    include ANSI

    attr_reader :parser

    def initialize(use_ascii, colorize, json)
      @use_ascii = use_ascii
      @colorize = colorize
      @parser = Parser.new(json)
      @terminal_width = Integer(`tput cols`)
    end

    def pretty_format(___)
      puts @json
    end

    def spaces(cnt)
      ' ' * cnt
    end

    def color_percentage(percentage)
      color_func = color_for(percentage)
      str_rep = (percentage * 100).to_s + ' %'
      color_func.call(str_rep)
    end

    def pretty_coverage_info(target)
      name, covered, total, percentage = @parser.extract_coverage_info(target)
      [name, covered.to_s, total.to_s, color_percentage(percentage)]
    end

    def align_formats(arrays)
      column_sizes = arrays.map(&:length)
      common_column_size = column_sizes[0]
      if column_sizes.to_set.length != 1
        puts column_sizes
        raise 'All rows must have same number of columns to be aligned'
      end

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
