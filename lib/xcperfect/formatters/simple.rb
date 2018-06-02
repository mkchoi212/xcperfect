module XCPerfect
  # Simple just prints the following information
  # - Target Name
  # - Number of lines hit
  # - Total number of lines
  # - Coverage percentage
  class Simple < Formatter
    def format_coverage_percentage(target)
      percentage = @parser.coverage_percentage(target)
      color_percentage(percentage)
    end

    def extract_simple_info(target)
      [
        target['name'],
        @parser.covered_line_num(target).to_s,
        @parser.total_line_num(target).to_s,
        format_coverage_percentage(target)
      ]
    end

    def pretty_format(targets)
      output = [['Target', 'Covered', 'Out of', 'Percentage']]

      @parser.extract(targets).each do |target|
        output << extract_simple_info(target)
      end
      output << extract_simple_info(@parser.json)

      rows = align(output)
      sentences = rows.collect { |row| row.join(' ') }

      divider = '-' * sentences[0].length
      sentences[0] = white(sentences[0])

      sentences.insert(1, divider)
      sentences.insert(sentences.length - 1, divider).join("\n")
    end
  end
end
