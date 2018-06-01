module XCPerfect
  # Parser is used by `Formatter`s to extract information from the 
  # JSON file generated by xccov
  class Parser
    KEY_LINE_COVERAGE = 'lineCoverage'.freeze
    KEY_TARGETS = 'targets'.freeze
    KEY_EXECUTABLE_LINES = 'executableLines'.freeze
    KEY_COVERED_LINES = 'coveredLines'.freeze

    attr_accessor :json

    def initialize(json)
      @json = json
    end

    def all_targets
      @json[KEY_TARGETS]
    end

    def extract(targets)
      if targets.length.zero?
        all_targets
      else
        all_targets.select do |target_info|
          pure_name = target_info['name'].split('.')
          pure_name.pop(1)
          pure_name = pure_name.join('.')
          targets.include?(pure_name)
        end
      end
    end

    def coverage_percentage(target)
      (target[KEY_LINE_COVERAGE] * 100).round(2).to_s + ' %'
    end
  end
end