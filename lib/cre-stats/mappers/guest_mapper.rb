module CRE
  module Stats
    module Mappers
      class GuestMapper
        class << self
          #
          # Loads a number of guests from a comma-separated list
          #
          def load(list)
            list.split(', ')
          end
        end
      end
    end
  end
end
