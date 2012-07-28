module CRE
  module Stats
    module Presenters
      class EpisodesPresenter
        class << self
          def to_json(json, episodes)
            json.episodes do |json|
              json.urltemplate "/episodes"
              json.label do |json|
                json.en "Episoden"
                json.de "Folgen"
              end

              json.count episodes.count

              json.episodes(episodes) do |json, episode|
                EpisodePresenter.to_json(json, episode)
              end
            end
          end
        end
      end
    end
  end
end
