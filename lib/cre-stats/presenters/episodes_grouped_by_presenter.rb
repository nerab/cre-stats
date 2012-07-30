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
                  overall = episodes_in_group.inject(0){|sum, e| sum + e.duration}.to_i
                  json.overall overall
                  json.average overall / episodes_in_group.size
                  json.min -1
                  json.max -1
                  json.mean -1
                end
              end
            end
          end
        end
      end
    end
  end
end
