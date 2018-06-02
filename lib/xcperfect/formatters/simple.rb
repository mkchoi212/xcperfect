module XCPerfect
  # Simple just prints the following information
  # - Target Name
  # - Number of lines hit
  # - Total number of lines
  # - Coverage percentage
  class Simple < Formatter
    def pretty_coverage_info(target)
      info = @parser.extract_coverage_info(target)
      info[3] = color_percentage(info[3])
      info
    end

    def pretty_format(desirables)
      output = [['Target', 'Covered', 'Out of', 'Percentage']]

      @parser.extract_targets(desirables).each do |target|
        output << pretty_coverage_info(target)
      end
      output << pretty_coverage_info(@parser.json)

      rows = align(output)
      sentences = rows.collect { |row| row.join(' ') }

      divider = '-' * sentences[0].length
      sentences[0] = white(sentences[0])

      sentences.insert(1, divider)
      sentences.insert(sentences.length - 1, divider).join("\n")
    end
  end
end
