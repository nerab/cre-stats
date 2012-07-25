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
        @episodes = {}
      end

      def add_episode(e)
        @episodes[e.uri.path] = e
      end

      def episode(path)
        @episodes[path].dup
      end

      def episodes
        @episodes.values.dup
      end
    end
  end
end
