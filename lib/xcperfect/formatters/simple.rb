module XCPerfect
  class Simple < Formatter
    def pretty_format(targets)
      @parser.extract(targets).each do |target|
        puts target['name'] + " " + @parser.coverage_percentage(target)
      end

      puts "Project total " + @parser.coverage_percentage(@parser.json)
    end
  end
end
