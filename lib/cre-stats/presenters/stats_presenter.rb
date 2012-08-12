module CRE
  module Stats
    module Presenters
      class StatsPresenter
        class << self
          def to_json(json, durations, stats = %w[mean variance standard_deviation sum min max])
            stats.each do |stat|
              begin
                json.set!(stat, durations.send(stat).to_s)
              rescue
                STDERR.puts "***** #{$!.message} when calculating #{stat} on #{durations.inspect}"
                next
              end
            end
          end
        end
      end
    end
  end
end
