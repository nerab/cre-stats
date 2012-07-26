module CRE
  module Stats
    #
    # Fetches CRE data
    #
    class Fetcher
      def initialize(base_url = 'http://cre.fm')
        @base_url = URI(base_url)
      end

      def episodes
        open(@base_url.merge('/archiv')).read
      end
    end
  end
end
