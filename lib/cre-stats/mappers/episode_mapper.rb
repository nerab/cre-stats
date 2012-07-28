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
      #
      # Maps a single episode from its HTML representation to a new Episode object
      #
      class EpisodeMapper
        class << self
          def load(doc)
            Episode.new.tap do |e|
              e.thumbnail = URI(doc.xpath('td[@class="thumbnail"]/img/@src').first)
              e.released_at = Date.parse(doc.xpath('td[@class="date"]/span[@class="release_date"]').first)
              title_block = doc.xpath('td[@class="title"]')
              e.title  = title_block.xpath('a/strong').first.text
              e.subtitle = title_block.xpath('em').first.text
              e.uri = URI(title_block.xpath('a/@href').first.value)
              GuestMapper.load(title_block.xpath('strong').first.next.text.strip).each{|guest| e.add_guest(guest)}
              e.duration = DurationMapper.load(doc.xpath('td[@class="duration"]').first.text)

              # Extract the id from the URI. If no match was found, the match will yield
              # nil, which is then converted to 0 by to_i. The validation of
              e.id = /\d{3,}$/.match(e.uri.to_s){|m| m[0]}.to_i
            end
          end
        end
      end
    end
  end
end
