=begin
  <tr class="podcast_archive_element">
    <td class="thumbnail"><img width="64" height="64" src="http://cre.fm/files/2012/06/cre193-old-school-computing-150x150.jpg" class="attachment-64x64 wp-post-image" alt="cre193-old-school-computing" title="cre193-old-school-computing"></td>
    <td class="date">
      <span class="release_date">15.06.2012</span>
    </td>
    <td class="title">
      <a href="http://cre.fm/cre193"><strong>CRE193 Old School Computing</strong></a><br>
      <em>Computertechnik der 70er Jahre vor der Erfindung des Mikrocomputers</em>
  <br>
      <strong>Gesprächspartner:</strong> Klaus Landzettel
    </td>
    <td class="duration">
      01:42:41
    </td>
  </tr>
=end
module CRE
  module Stats
    module Mappers
      class EpisodeMapper
        class << self
          def load(doc)
            Episode.new.tap do |e|
              e.thumbnail = URI(doc.find_first('td[@class="thumbnail"]/img/@src').value)
              e.released_at = Date.parse(doc.find_first('td[@class="date"]/span[@class="release_date"]').content)
              title_block = doc.find_first('td[@class="title"]')
              e.title  = title_block.find_first('a/strong').content
              e.subtitle = title_block.find_first('em').content
              e.uri = URI(title_block.find_first('a/@href').value)
              e.guests << title_block.find_first('strong').next.content.strip
              e.duration = parse_duration(doc.find_first('td[@class="duration"]').content)
            end
          end

          private

          def parse_duration(str)
            hms = DURATION_REGEXP.match(str)
            raise "The duration #{str} does not match the expected format #{DURATION_REGEXP}" if hms.nil?
            hms.captures[0].to_i * 60 * 60 + hms.captures[1].to_i * 60 + hms.captures[2].to_i
          end

          DURATION_REGEXP = /([0-9]{2}):([0-9]{2}):([0-9]{2})/
        end
      end
    end
  end
end
