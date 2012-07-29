module CRE
  module Stats
    module Presenters
      class GuestsPresenter
        class << self
          def to_json(json, guests, include_children = false)
            json.guests do |json|
              json.urltemplate "/guests"
              json.label do |json|
                json.en "Guests"
                json.de "Gauml;ste"
              end

              json.count guests.nil? ? -1 : guests.count
            end
          end
        end
      end
    end
  end
end
