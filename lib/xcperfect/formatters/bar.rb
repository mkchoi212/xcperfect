require 'xcperfect/ansi'

module XCPerfect
  class Bar
    # Creates a progress bar with the provided `percentage``
    # Note that `percentage` must be a float between 0 and 1
    def intialize(ascii, colorize)
      @ascii = ascii
      @colorize = colorize
    end

    def self.create(percentage)
      '------'
    end
  end
end
