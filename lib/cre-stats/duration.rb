module CRE
  module Stats
    #
    # Represents durations in hh:mm:ss format
    #
    # Parts taken from https://gist.github.com/309694
    #
    class Duration < Numeric
      def initialize(val = 0)
        case val
        when String
          @seconds = parse_string(val)
        when Numeric
          @seconds = val.to_i
        when nil
          @seconds = 0
        else
          raise ArgumentError, "Cannot convert #{val} to Duration"
        end
      end

      def coerce(other)
        [Duration.new(other.to_i), self]
      end

      #
      # returns the total duration in seconds
      #
      def to_i
        @seconds
      end

      #
      # returns the hours part of the total duration
      #
      def hours
        @seconds.abs / 60 / 60  * (@seconds < 0 ? -1 : 1)
      end

      #
      # returns the hours part of the total duration
      #
      def minutes
        (@seconds.abs / 60) % 60 * (@seconds < 0 ? -1 : 1)
      end

      #
      # Returns the seconds part of the total duration. For the total in seconds
      # use #to_i.
      #
      def seconds
        @seconds.abs % 60 * (@seconds < 0 ? -1 : 1)
      end

      def to_s
        "#{'-' if @seconds < 0}#{'%02d' % hours.abs}:#{'%02d' % minutes.abs}:#{'%02d' % seconds.abs}"
      end

      def eql?(other)
        self.class.equal?(other.class) && @seconds == other.to_i
      end

      def ==(other)
        @seconds == other.to_i
      end

      # delegate to seconds
      extend Forwardable
      def_delegators :@seconds, :hash, :zero?, :nonzero?, :between?

      include Comparable

      def <=>(other)
        case other
        when Duration
          @seconds <=> other.to_i
        when Numeric
          @seconds <=> other
        else
          a, b = other.coerce(self)
          a <=> b
        end rescue nil
      end

      def +@
        self
      end

      def -@
        Duration.new(-@seconds)
      end

      def +(other)
        op(:+, other)
      end

      def -(other)
        op(:-, other)
      end

      private

      DURATION_REGEXP = /([0-9]{2}):([0-9]{2}):([0-9]{2})/

      #
      # Loads a duration (seconds) from hh:mm:ss string
      #
      def parse_string(str)
        hms = DURATION_REGEXP.match(str)
        raise ArgumentError, "The duration #{str} does not match the expected format #{DURATION_REGEXP}" if hms.nil?
        hms.captures[0].to_i * 60 * 60 + hms.captures[1].to_i * 60 + hms.captures[2].to_i
      end

      # generic operator implementation
      def op(sym, o)
        case o
        when Duration
          Duration.new(@seconds.send(sym, o.to_i))
        when Numeric
          Duration.new(@seconds.send(sym, o))
        else
          a, b = o.coerce(self)
          a.send(sym, b)
        end
      end
    end
  end
end
