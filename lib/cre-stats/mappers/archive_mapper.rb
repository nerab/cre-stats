module CRE
  module Stats
    module Mappers
      class ArchiveMapper
        class << self
          def load(doc)
            Archive.new.tap do |a|
              doc.xpath("//tr[@class='podcast_archive_element']").each do |tr|
                a.add_episode(Mappers::EpisodeMapper.load(tr))
              end
            end
          end
        end
      end
    end
  end
end
