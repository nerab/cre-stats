module CRE
  module Stats
    class Episode
      include ActiveModel::Validations

      attr_accessor :title, :uri, :released_at, :subtitle, :thumbnail, :duration
      attr_reader   :guests

      validates :title, :uri, :released_at, :duration, :subtitle, :thumbnail,
                :presence => true

      validates :duration, :numericality => {:only_integer => true, :greater_than => 0}

      validates :guests, :with => :validates_count
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

      def validates_count(attrib)
        errors[attrib] << "Must have at least one #{attrib.to_s.singularize}" if send(attrib).empty?
      end

      def validates_uri(attrib)
        begin
          URI(send(attrib))
        rescue
          errors[attrib] << "Must be a URL. #{$!.message}"
        end
      end
    end
  end
end
