module CRE
  module Stats
    class Episode
      include ActiveModel::Validations

      attr_accessor :id, :title, :uri, :released_at, :subtitle, :thumbnail, :duration
      attr_reader   :guests

      validates :id, :title, :uri, :released_at, :duration, :subtitle, :thumbnail, :duration,
                :presence => true

      validates :duration, :with => :validates_duration
      validates :uri, :thumbnail, :with => :validates_uri

      def initialize
        @guests = []
      end

      def add_guest(guest)
        return if guest.nil?
        @guests << guest
        @guests.uniq!
      end

      private

      def validates_duration(attrib)
        errors[attrib] << "#{attrib} must be longer than zero" unless send(attrib).to_i > 0
      end

      def validates_uri(attrib)
        begin
          URI(send(attrib))
        rescue
          errors[attrib] << "#{attrib} must be a valid URL. #{$!.message}"
        end
      end
    end
  end
end
