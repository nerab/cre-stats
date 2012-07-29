module CRE
  module Stats
    module Presenters
      #
      # returns the presenter for +resource_name+ or RootPresenter if resource_name is blank
      # e.g. EpisodesPresenter for 'episodes'
      #
      def self.find(resource_name = nil)
        if resource_name.blank?
          RootPresenter
        else
          const_get("#{resource_name.to_s.titleize}Presenter")
        end
      end

      class RootPresenter
        class << self
          def to_json(json, resources, include_children = false)
            json.resources do |json|
              json.self do |json|
                json.urltemplate "/"
                json.label do |json|
                  json.en "Home"
                  json.de "Home"
                end
              end

              if include_children
                resources.each do |resource|
                  Presenters.find(resource.class.name.demodulize).to_json(json, resource)
                end
              end

              # TODO Provide how to get to episodes by_year
              # with a proper URI template
            end
          end
        end
      end
    end
  end
end
