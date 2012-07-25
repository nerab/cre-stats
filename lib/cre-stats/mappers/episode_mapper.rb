module CRE
  module Stats
    module Mappers
      class EpisodeMapper
        class << self
          def load(html)
            Episode.new.tap do |e|
              e.thumbnail = URI(html.x)
              e.released_at = Date.parse(html.x)
              e.title  = html.x
              e.subtitle = html.x
              e.uri = URI(html.x)
              e.guests << html.x
              e.duration = parse_duration(html.x)
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
