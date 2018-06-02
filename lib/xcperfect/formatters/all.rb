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
      stats = file['functions'].map do |function|
        filename = file['name']
        stats = pretty_coverage_info(function)
        stats[0] = Syntax.highlight(filename, stats[0])
        stats
      end

      rows = align(stats)
      rows.map { |row| "\t\t" + row.join(' ') }
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
