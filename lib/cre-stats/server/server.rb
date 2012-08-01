#
# Test with +bundle exec shotgun+
#
module CRE
  module Stats
    class Server < Sinatra::Base
      include CRE::Stats

      before do
        @resources = ResourceRegistry.new(Fetcher.new)
      end

      get '/' do
        Jbuilder.encode do |json|
          Presenters.find.to_json(json, @resources, true)
        end
      end

      # /episodes/by-year etc.
      get '/episodes/by-:period' do
        Jbuilder.encode do |json|
          grouped = @resources[:episodes].group_by{|e| e.released_at.send(params[:period])}
          Presenters.find(:episodes_grouped_by).to_json(json, grouped, params[:period], true)
        end
      end

# TODO
# /episodes/by-year?year=2005&year=2006&year=2007
# /guests/by-month?from=200501&to=201106
# /guests/by-month etc.

      # /episodes
      # /guests
      get '/:resources' do
        Jbuilder.encode do |json|
          Presenters.find(params[:resources]).to_json(json, @resources[params[:resource]], true)
        end
      end

      # /episode/cre194
      # /guest/Martin%20Haase
      get '/:resource/:id' do
        Jbuilder.encode do |json|
          presenter = Presenters.find(params[:resource])
          presenter.to_json(json, @resources[params[:resource].pluralize].find(params[:id]), true)
        end
      end
    end
  end
end
