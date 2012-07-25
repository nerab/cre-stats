module CRE
  module Stats
    #
    # An archive is a repository of episodes
    #
    class Archive
      class << self
        def load(url = 'http://cre.fm/archiv')
          Mappers::ArchiveMapper.load(Nokogiri::HTML(open(url).read))
        end
      end

      def initialize
        @episodes_by_path = {}
        @episodes_by_guest = Hash.new{|hash, key| hash[key] = []}
      end

      def add_episode(e)
        @episodes_by_path[e.uri.path] = e
        e.guests.each{|guest| @episodes_by_guest[guest] << e}
      end

      def find(id)
        @episodes_by_path["/cre#{"%03d" % id}"]
      end

      def find_by_guest(guest)
        @episodes_by_guest[guest]
      end

      def all
        @episodes_by_path.values.dup
      end
    end
  end
end
