module CRE
  module Stats
    class Archive
      def initialize(nodes)
        @episodes = {}
        nodes.each do |tr|
          e = Mappers::EpisodeMapper.load(tr)
          @episodes[e.uri.path] = e
        end
      end

      def episode(nr)
        @episodes[nr].dup
      end

      def episodes
        @episodes.values.dup
      end
    end
  end
end
