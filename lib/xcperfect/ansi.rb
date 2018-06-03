module XCPerfect
  # ANSI applies color & style to the output to make it
  # look more appealing to the eye
  module ANSI
    attr_accessor :colorize

    FORMATTED_MATCHER = %r{\e\[(\d+)[;]?(\d+)?m(.*)\e\[0m}

    EFFECT = {
      reset: '0',
      bold: '1',
      underline: '4'
    }.freeze

    COLORS = {
      black: '30',
      red: '31',
      green: '32',
      yellow: '33',
      blue: '34',
      cyan: '36',
      white: '37',
      plain: '39'
    }.freeze

    def colorize?
      !!@colorize
    end

    def color_for(percentage)
      case (percentage * 100).round
      when 0..33
        ->(x) { red(x) }
      when 33...66
        ->(x) { yellow(x) }
      when 66..100
        ->(x) { green(x) }
      else
        raise "Percentage of #{percentage * 100} is not possible"
      end
    end

    def white(text)
      ansi_parse(text, :plain, :bold)
    end

    def red(text)
      ansi_parse(text, :red)
    end

    def green(text)
      ansi_parse(text, :green, :bold)
    end

    def cyan(text)
      ansi_parse(text, :cyan)
    end

    def yellow(text)
      ansi_parse(text, :yellow)
    end

    def applied_effects(text)
      effects = []
      if text =~ FORMATTED_MATCHER
        colors = COLORS.invert[$1]
        effect = EFFECT.invert[$2]
        effects << colors if colors
        effects << effect if effect
      end
      effects
    end

    def strip(text)
      text =~ FORMATTED_MATCHER ? $3 : text
    end

    def ansi_parse(text, color, effect=nil)
      return text unless colorize?
      colors_code = COLORS[color] || ''
      effect_code = EFFECT[effect] ? ';' + EFFECT[effect] : ''
      "\e[#{colors_code}#{effect_code}m#{text}\e[#{EFFECT[:reset]}m"
    end
  end
end
