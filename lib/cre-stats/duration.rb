module CRE
  module Stats
    class Duration
      attr_reader :seconds

      def initialize(seconds = 0)
        @seconds = seconds
      end

      def +(other)
          @seconds += other.seconds
      end

      def coerce(other)
        [Duration.new(other.to_i), self]
      end

      def to_s
        "#{@seconds} s"
      end
    end
  end
end
