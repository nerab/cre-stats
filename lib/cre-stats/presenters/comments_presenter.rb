module CRE
  module Stats
    module Presenters
      class CommentsPresenter
        class << self
          def to_json(json, comments, include_children = false)
            json.comments do |json|
              json.urltemplate "/comments"
              json.label do |json|
                json.en "Comments"
                json.de "Kommentare"
              end

              json.count comments.nil? ? -1 : comments.count
            end
          end
        end
      end
    end
  end
end
