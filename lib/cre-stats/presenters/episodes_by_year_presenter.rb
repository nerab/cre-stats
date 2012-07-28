module CRE
  module Stats
    module Presenters
      class EpisodesByYearPresenter
        class << self
          def to_json(json, episodes)
            json.by_year(episodes.all.group_by{|e| e.released_at.year}) do |json, group|
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
