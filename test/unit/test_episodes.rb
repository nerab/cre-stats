require 'helper'

class TestEpisodes < MiniTest::Unit::TestCase
  include CRE::Stats
  include CRE::Stats::Resources

  def setup
    @episodes = mocked('setup'){Episodes.new(Fetcher.new)}
  end

  def test_size
    refute_nil(@episodes)
    assert_equal(194, @episodes.count)
  end

  def test_mean
    assert_in_delta(Duration.new('1:43:00'), @episodes.mean{|e| e.duration}, 60) # minute precision
    assert_in_delta(1.1, @episodes.mean{|e| e.guests.count}, 0.1)
  end
end
