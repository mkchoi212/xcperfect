module XCPerfect
  # All prints all code coverage information provided by xccov
  class All < Formatter
    DOWN = '▼'.freeze
    DOWN_ASCII = '->'.freeze

    def pretty_name(target)
      symbol = yellow(@use_ascii ? DOWN_ASCII : DOWN)
      [symbol, white(target['name'])].join(' ')
    end

    def pretty_functions(file)
      file['functions'].map do |function|
        filename = file['name']
        signature, covered, total, percentage = pretty_coverage_info(function)
        line_stat = [covered, total].join(' / ').ljust(10)
        stats = [line_stat, percentage].join("\t\t")
        highlighted = Syntax.highlight(filename, signature)
        delta = highlighted.length - signature.length
        fill_size = (@terminal_width / 1.5) + delta
        "\t\t" + [highlighted.ljust(fill_size), stats].join(' ')
      end
    end

    def pretty_files(target)
      target['files'].map do |file|
        name = "\t" + pretty_name(file)
        function = pretty_functions(file)
        [name, function]
      end.join("\n")
    end

    def pretty_format(desirables)
      @parser.extract_targets(desirables).map do |target|
        [pretty_name(target), pretty_files(target)]
      end.join("\n")
    end
  end
end
