require 'uri'
require 'active_model'
require 'active_support/inflector'
require 'active_support/core_ext'

require 'nokogiri'
require 'open-uri'
require 'jbuilder'
require 'enumstats'
require 'hms'

require 'sinatra/base'

require 'require_all'
require_all 'lib'

# TODO Remove once server was extracted
require 'cre-stats/server/server'

module CRE
  module Stats
    # Your code goes here...
  end
end
