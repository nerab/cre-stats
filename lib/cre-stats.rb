require 'uri'
require 'active_model'
require 'active_support/inflector'
require 'nokogiri'
require 'open-uri'
require 'jbuilder'

require 'cre-stats/version'
require 'cre-stats/errors'
require 'cre-stats/duration'
require 'cre-stats/episode'
require 'cre-stats/episodes'
require 'cre-stats/fetcher'

require 'cre-stats/mappers/episodes_mapper'
require 'cre-stats/mappers/episode_mapper'
require 'cre-stats/mappers/guest_mapper'
require 'cre-stats/mappers/duration_mapper'

require 'cre-stats/presenters/presenter'
require 'cre-stats/presenters/episodes_presenter'
require 'cre-stats/presenters/episode_presenter'

module CRE
  module Stats
    # Your code goes here...
  end
end
