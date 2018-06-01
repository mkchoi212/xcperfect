module XCPerfect
  class All < Formatter
    def pretty_format(targets)
      puts @parser.extract(targets)
      puts "Project total " + @parser.coverage_percentage(@parser.json)
    end
  end
end
