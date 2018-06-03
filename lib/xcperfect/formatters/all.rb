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
        width = @terminal_width - 8

        filename = file['name']
        signature, covered, total, percentage = @parser.extract_coverage_info(function)

        line_stats = "#{covered} / #{total}".ljust(10)
        highlighted = Syntax.highlight(filename, signature)

        delta = highlighted.length - signature.length
        highlighted = highlighted.ljust((width * 0.6) + delta)

        texts = spaces(8) + [highlighted, line_stats].join(' ')
        bar = Bar.create(percentage, (width * 0.3) - line_stats.length, @colorize, @use_ascii)
        texts + bar
      end
    end

    def pretty_files(target)
      target['files'].map do |file|
        name = spaces(4) + pretty_name(file)
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
