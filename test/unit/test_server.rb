require 'helper'
require 'rack/test'
require 'multi_json'

class TestServer < MiniTest::Unit::TestCase
  include CRE::Stats
  include Rack::Test::Methods

  def app
    CRE::Stats::Server
  end

  def test_root
    response = get_json('/')
    assert_equal(194, response[:resources][:episodes][:count])
  #  assert_equal(194, response[:resources][:episodes][:duration][:sum])
  #  assert_equal(194, response[:resources][:episodes][:duration][:average])
  end

  def test_episodes
    response = get_json('/episodes')
    assert_equal(194, response[:episodes][:count])
  end

  def test_with_params
    id = 'cre194'
    assert_equal(id, get_json("/episode/#{id}")[:id])
  end

  def test_group_by_year
    response = get_json('/episodes/by-year')
    assert_equal(13, response[:episodes][:by_year][:'2005'][:episodes][:count])
  end

  private

  def get_json(uri, params = {}, env = {}, &block)
    mocked('setup'){get(uri, params, env, &block)}
    json = last_response.body
    MultiJson.load(json, :symbolize_keys => true)
  end
end
