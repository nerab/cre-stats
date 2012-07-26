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
                a << Mappers::EpisodeMapper.load(tr)
              end
            end
          end
        end
      end
    end
  end
end
