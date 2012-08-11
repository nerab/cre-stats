module CRE
  module Stats
    module Presenters
      class EpisodesGroupedByPresenter
        class << self
          def to_json(json, groups, period, include_children = false)
            # TODO Move to common class with EpisodesPresenter
            json.episodes do |json|
              json.urltemplate "/episode/{id}"
              json.label do |json|
                json.en "Episode"
                json.de "Folge"
              end

              json.set!("by_#{period}") do |json|
                groups.each do |label, episodes|
                  json.set!(label) do |json|
                    EpisodesPresenter.to_json(json, episodes, false)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
