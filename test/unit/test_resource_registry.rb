require 'helper'

class TestResourceRegistry < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @meta = mocked('setup'){ResourceRegistry.new(Fetcher.new)}
    refute_nil(@meta)
  end

  def test_episodes
    episodes = @meta['episodes']
    refute_nil(episodes)
    assert_equal(194, episodes.count)
  end

  def test_guests
    skip "Off until Guest class is introduced"
    guests = @meta['guests']
    refute_nil(guests)
    assert_equal(194, guests.count)
  end

  def test_comments
    skip "Off until Comment class is introduced"
    comments = @meta['comments']
    refute_nil(comments)
    assert_equal(194, comments.count)
  end
end
