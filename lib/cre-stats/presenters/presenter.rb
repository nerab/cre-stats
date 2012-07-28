module CRE
  module Stats
    module Presenters
      class Presenter
        class << self
          def to_json(json, episodes)
            json.resources do |json|
              json.self do |json|
                json.urltemplate "/"
                json.label do |json|
                  json.en "Home"
                  json.de "Home"
                end
              end

              EpisodesPresenter.to_json(json, episodes)

              # TODO Provide how to get to episodes by_year

              json.guests do |json|
                json.urltemplate "/guests"
                json.label do |json|
                  json.en "Guests"
                  json.de "Gauml;ste"
                end
                json.count -1
              end

              json.comments do |json|
                json.urltemplate "/comments"
                json.label do |json|
                  json.en "Comments"
                  json.de "Kommentare"
                end
                json.count -1
              end
            end
          end
        end
      end
    end
  end
end
