module CRE
  module Stats
    class EpisodeInvalid < StandardError
      attr_reader :episode

      def initialize(episode)
        @episode = episode
        super("Validation of episode #{episode.id} failed: #{@episode.errors.full_messages.join(', ')}")
      end
    end
  end
end
