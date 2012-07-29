module CRE
  module Stats
    class Resource
      attr_reader :title

      def initialize
        @title = self.class.name.demodulize
      end
    end
  end
end
