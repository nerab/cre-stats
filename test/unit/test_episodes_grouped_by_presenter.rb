require 'helper'

class TestEpisodesGroupedByPresenter < MiniTest::Unit::TestCase
  include CRE::Stats
  include CRE::Stats::Resources
  include CRE::Stats::Presenters

  def setup
    @episodes = mocked('setup'){Episodes.new(Fetcher.new)}
  end

  def test_by_year
    presented = Jbuilder.encode do |json|
      EpisodesGroupedByPresenter.to_json(json, @episodes.group_by{|e| e.released_at.year}, :year)
    end

    parsed = MultiJson.load(presented, :symbolize_keys => false)
    assert_equal(13, parsed['by-year']['2005']['count'])
  end
end
