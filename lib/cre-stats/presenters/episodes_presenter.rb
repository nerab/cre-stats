module CRE
  module Stats
    module Presenters
      class EpisodesPresenter
        class << self
          def to_json(json, episodes, include_children = false)
            json.episodes do |json|
              json.urltemplate "/episode/{id}"
              json.label do |json|
                json.en "Episode"
                json.de "Folge"
              end

              if episodes.nil?
                json.count -1
              elsif !episodes.respond_to?(:count)
                json.count 1
                EpisodePresenter.to_json(json, episodes)
              else
                json.count episodes.count

                json.episodes(episodes) do |json, episode|
                  EpisodePresenter.to_json(json, episode)
                end if include_children

                json.set!('duration_stats') do |json|
                  StatsPresenter.to_json(json, episodes.map{|e| e.duration})
                end
              end
            end
          end
        end
      end
    end
  end
end
