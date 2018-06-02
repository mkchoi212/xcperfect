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
      end
    end

    def pretty_files(target)
      target['files'].map do |file|
        name = "\t" + pretty_name(file)
        function = pretty_functions(file)
        [name, function]
      end.join("\n")
    end

    def pretty_format(targets)
      @parser.extract(targets).map do |target|
        [pretty_name(target), pretty_files(target)]
      end.join("\n")
    end
  end
end
