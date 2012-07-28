module CRE
  module Stats
    module Mappers
      class EpisodesMapper
        #
        # Returns an array of episodes in the same order the HTML provides
        #
        class << self
          def load(doc)
            [].tap do |a|
              doc.xpath("//tr[@class='podcast_archive_element']").each do |tr|
                episode = Mappers::EpisodeMapper.load(tr)
                raise EpisodeInvalid.new(episode) if episode.invalid?
                a << episode
              end
            end
          end
        end
      end
    end
  end
end
