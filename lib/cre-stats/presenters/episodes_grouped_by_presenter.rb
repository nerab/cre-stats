module CRE
  module Stats
    module Presenters
      class EpisodesGroupedByPresenter
        class << self
          def to_json(json, episodes, period, include_children = false)
            # TODO JSON name of the period must account for the canonical period:
            # year
            # year-quarter
            # year-month
            # year-week
            json.grouped do |json|
              json.by period.to_s

              json.groups(episodes) do |json, groups|
                grouped_by, episodes_in_group = groups.first, groups.last

                json.grouping grouped_by.to_s
                json.count episodes_in_group.size

                json.duration do |json|
                  # TODO Move this to StatsPresenter that can be re-used for all arrays
                  durations = episodes_in_group.map{|e| e.duration}
                  StatsPresenter.to_json(json, durations)
                end
              end
            end
          end
        end
      end
    end
  end
end
