module CRE
  module Stats
    module Presenters
      class EpisodesGroupedByPresenter
        class << self
          def to_json(json, episodes, period, include_children = false)
            # TODO Meta-ify for the period passed
            # TODO JSON name of the period must account for the canonical period:
            # year
            # year-quarter
            # year-month
            # year-week
            json.year episodes do |json, group|
              year, episodes_in_year = group.first, group.last
              json.year year.to_s
              json.count episodes_in_year.size

              json.duration do |json|
                overall = episodes_in_year.inject(0){|sum, e| sum + e.duration}.to_i
                json.overall overall
                json.average overall / episodes_in_year.size
              end
            end
          end
        end
      end
    end
  end
end
