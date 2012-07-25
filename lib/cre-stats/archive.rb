module CRE
  module Stats
    class Archive
      def initialize(doc)
        @episodes = {}
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
