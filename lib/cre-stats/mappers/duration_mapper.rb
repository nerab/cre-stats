module CRE
  module Stats
    module Mappers
      class DurationMapper
        class << self
          #
          # Loads a duration (seconds) from hh:mm:ss string
          #
          def load(str)
            hms = DURATION_REGEXP.match(str)
            raise "The duration #{str} does not match the expected format #{DURATION_REGEXP}" if hms.nil?
            hms.captures[0].to_i * 60 * 60 + hms.captures[1].to_i * 60 + hms.captures[2].to_i
          end

          private

          DURATION_REGEXP = /([0-9]{2}):([0-9]{2}):([0-9]{2})/
        end
      end
    end
  end
end
