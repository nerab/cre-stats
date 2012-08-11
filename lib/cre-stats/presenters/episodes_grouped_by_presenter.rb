module CRE
  module Stats
    module Presenters
      class EpisodesGroupedByPresenter
        class << self
          def to_json(json, groups, period, include_children = false)
            # TODO JSON name of the period must account for the canonical period:
            # year
            # year-quarter
            # year-month
            # year-week
            json.set!("by-#{period}") do |json|
              #json.groups(episodes) do |json, groups|
              groups.each do |label, episodes|
                json.set!(label) do |json|
                  json.count episodes.size
                  StatsPresenter.to_json(json, episodes.map{|e| e.duration}, 'duration_stats')
                end
              end
            end
          end
        end
      end
    end
  end
end
