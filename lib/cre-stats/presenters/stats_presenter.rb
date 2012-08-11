module CRE
  module Stats
    module Presenters
      class StatsPresenter
        class << self
          def to_json(json, durations, label = :stats, stats = %w[mean variance standard_deviation sum min max])
            json.set!(label) do |json|
              stats.each do |stat|
                json.set!(stat, durations.send(stat).to_s)
              end
            end
          end
        end
      end
    end
  end
end
