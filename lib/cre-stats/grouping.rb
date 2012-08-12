module CRE
  module Stats
    module Grouping
      def self.get(period)
        begin
          const_get("#{period.to_s.camelize}Grouping").new
        rescue LoadError => e
          raise ArgumentError, "#{period} is not a known grouping"
        end
      end

      class YearGrouping
        def apply(date)
          date.year.to_s
        end
      end

      class MonthGrouping
        def apply(date)
          "#{date.year}-#{'%02d' % date.month}"
        end
      end
    end
  end
end
