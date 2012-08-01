require 'helper'
require 'rack/test'
require 'multi_json'

class TestServer < MiniTest::Unit::TestCase
  include CRE::Stats
  include Rack::Test::Methods

  def app
    CRE::Stats::Server
  end

  def test_my_default
    assert_equal(194, get_json('/')[:resources][:episodes][:count])
  end

  def test_with_params
    id = 'cre194'
    assert_equal(id, get_json("/episode/#{id}")[:id])
  end

  private

  def get_json(uri, params = {}, env = {}, &block)
    mocked('setup'){get(uri, params, env, &block)}
    MultiJson.load(last_response.body, :symbolize_keys => true)
  end
end
