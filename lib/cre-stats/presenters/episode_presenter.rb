module CRE
  module Stats
    module Presenters
      #
      # Presents a single episode as JSON
      #
      class EpisodePresenter
        class << self
          def to_json(json, episode, include_children = false)
            return if episode.nil?

            json.id episode.id
            json.title episode.title
            json.subtitle episode.subtitle

            # For timestamps, JavaScript prefers _milli_seconds since epoch
            json.released_at episode.released_at.to_time.to_i * 1000
            json.duration (episode.duration.to_i * 1000)

            json.uri episode.uri.to_s
            json.thumbnail episode.thumbnail.to_s

            # Guests are so few that we always present them, regardless of include_children
            json.guests(episode.guests)
            # TODO Introduce proper Guest class with id, name and URI
=begin
            json.guests(episode.guests) do |json, guest|
              json.id guest.id
              json.name guest.name
              json.uri guest.uri
            end
=end
          end
        end
      end
    end
  end
end
