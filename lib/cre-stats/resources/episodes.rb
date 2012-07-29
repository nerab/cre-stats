module CRE
  module Stats
    module Resources
      #
      # Collection of episodes
      #
      class Episodes < Resource
        include Enumerable

        def initialize(fetcher)
          @episodes_by_path = {}
          @episodes_by_guest = Hash.new{|hash, key| hash[key] = []}
          @fetcher = fetcher
          reload
        end

        def add(e)
          @episodes_by_path[e.uri.path] = e
          e.guests.each{|guest| @episodes_by_guest[guest] << e}
        end

        def find(id)
          @episodes_by_path["/cre#{"%03d" % id}"]
        end

        def find_by_guest(guest)
          @episodes_by_guest[guest]
        end

        def reload
          Mappers::EpisodesMapper.load(Nokogiri::HTML(@fetcher.episodes)).reverse.each{|e| add(e)}
        end

        def each(&block)
          @episodes_by_path.values.each(&block)
        end

        def empty?
          @episodes_by_path.values.empty?
        end
      end
    end
  end
end
