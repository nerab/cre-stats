module CRE
  module Stats
    class Episode
      include ActiveModel::Validations

      attr_accessor :title, :uri, :released_at, :subtitle, :guests, :thumbnail
      attr_reader   :duration

      validates :title, :uri, :released_at, :duration, :subtitle, :guests, :thumbnail,
                :presence => true

      validates :duration, :numericality => { :only_integer => true, :greater_than => 0}

      def initialize
        @guests = []
      end

      def duration=(str)
        hms = DURATION_REGEXP.match(str)
        raise "The duration #{str} does not match the expected format #{DURATION_REGEXP}" if hms.nil?
        @duration = hms.captures[0].to_i * 60 * 60 + hms.captures[1].to_i * 60 + hms.captures[2].to_i
      end

      private

      DURATION_REGEXP = /([0-9]{2}):([0-9]{2}):([0-9]{2})/
    end
  end
end
