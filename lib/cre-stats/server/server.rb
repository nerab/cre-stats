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

# TODO
# /episodes/by-year?year=2005&year=2006&year=2007
# /guests/by-month?from=200501&to=201106

      get '/episodes' do
        Jbuilder.encode do |json|
          Presenters.find(:episodes).to_json(json, @resources[:episodes], true)
        end
      end

      get '/episode/:id' do
        Jbuilder.encode do |json|
          Presenters.find(:episode).to_json(json, @resources[:episodes].find(params[:id]), true)
        end
      end

      get '/episodes/by-:period' do
        Jbuilder.encode do |json|
          grouped = @resources[:episodes].group_by{|e| e.released_at.send(params[:period])}
          Presenters.find(:episodes_grouped_by).to_json(json, grouped, params[:period], true)
        end
      end

      get '/guests' do

      end

      get '/guest/:id' do

      end

      get '/guests/by-:period' do

      end
    end
  end
end
