module CRE
  module Stats
    class ResourceRegistry
      include Enumerable

      def initialize(fetcher)
        @fetcher = fetcher
        @resources = {}

        # http://stackoverflow.com/a/833179
        Resources.constants.select{|c| Class === Resources.const_get(c)}.each do |resource_class|
          @resources[resource_class.to_s.underscore.to_sym] = Resources.const_get(resource_class).new(@fetcher)
        end
      end

      def [](collection)
        @resources[collection.to_sym]
      end

      def each(&block)
        @resources.values.each(&block)
      end
    end
  end
end
