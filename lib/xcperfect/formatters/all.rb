module XCPerfect
  class All < Formatter
    def pretty_format(targets)
      @parser.extract(targets).each do |target|
        puts pretty_details(target)
        puts @parser.coverage_percentage(target)
      end

      puts @parser.coverage_percentage(@parser.json)
    end

    def pretty_details(target)
      puts target.keys
    end
  end
end
