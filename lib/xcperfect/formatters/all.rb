module XCPerfect
  # All prints all code coverage information provided by xccov
  class All < Formatter
    DOWN = '▼'.freeze
    DOWN_ASCII = '->'.freeze

    def pretty_name(target)
      symbol = yellow(@use_ascii ? DOWN_ASCII : DOWN)
      [symbol, white(target['name'])].join(' ')
    end

    def pretty_files(target)
      target['files'].map do |file|
        "\t" + pretty_name(file)
      end.join("\n")
    end

    def pretty_format(targets)
      @parser.extract(targets).map do |target|
        [pretty_name(target), pretty_files(target)]
      end.join("\n")
    end
  end
end
