module XCPerfect
  # All prints all code coverage information provided by xccov
  class All < Formatter
    DOWN = '▼'.freeze
    DOWN_ASCII = '->'.freeze
    STAT_WIDTH = 9

    def bar_width
      ((@terminal_width - 8) * 0.3) - STAT_WIDTH
    end

    def signature_width
      (@terminal_width - 8) * 0.62
    end

    def pretty_name(target)
      symbol = yellow(@use_ascii ? DOWN_ASCII : DOWN)
      [symbol, white(target['name'])].join(' ')
    end

    def pretty_functions(file)
      file['functions'].map do |function|
        filename = file['name']
        signature, covered, total, percentage = @parser.extract_coverage_info(function)

        line_stats = "#{covered} / #{total}".ljust(STAT_WIDTH)
        highlighted = Syntax.highlight(filename, signature)

        delta = highlighted.length - signature.length
        highlighted = highlighted.ljust(signature_width + delta)

        texts = spaces(8) + [highlighted, line_stats].join(' ')
        leftover = @terminal_width - texts.length + delta
        bar = Bar.create(percentage, bar_width, @colorize, @use_ascii)
        color_delta = bar.length - strip(bar).length
        bar = bar.rjust(leftover + color_delta - 1)
        texts + bar
      end
    end

    def pretty_files(target)
      target['files'].map do |file|
        name = spaces(4) + pretty_name(file)
        functions = pretty_functions(file)
        [name, functions]
      end.join("\n")
    end

    def pretty_overall(target)
      _, covered, total, percentage = @parser.extract_coverage_info(target)
      line_stats = "Total #{covered} / #{total}".ljust(STAT_WIDTH + 10)
      bar = Bar.create(percentage, bar_width, @colorize, @use_ascii)
      summary = line_stats + ' ' + bar
      color_delta = bar.length - strip(bar).length
      summary.rjust(@terminal_width + color_delta - 1)
    end

    def pretty_format(desirables)
      @parser.extract_targets(desirables).map do |target|
        [pretty_name(target), pretty_files(target), pretty_overall(target)]
      end.join("\n")
    end
  end
end
