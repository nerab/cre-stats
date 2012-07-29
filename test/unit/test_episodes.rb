require 'helper'

class TestEpisodes < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @episodes = Episodes.new(NullFetcher.new)
  end

  def test_empty
    refute_nil(@episodes)
    assert_equal(0, @episodes.count)
  end
end
