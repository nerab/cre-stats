require 'helper'

class TestArchiveLoad < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @archive = mocked('setup'){Archive.load}
  end

  def test_size
    assert_equal(194, @archive.all.size)
  end

  # TODO Continue checking after episode 60
  def test_guest_count
    [
      # Episodes without guests:
      [1, 2, 4, 8, 9, 18, 19, 21],
      # Episodes wit one guest
      [3, 5, 6, 7, (10..17).to_a, (22..46).to_a, 48, 49, 51, 52, 54, 56, 58, 59, ].flatten,
      # Episodes wit two guests
      [47, 50, 53, 55, 60, ],
      # Episodes wit three guests
      [20, 57, ],
    ].each_with_index do |episode_ids, guest_count|
      episode_ids.each do |id|
        episode = @archive.find(id)
        assert(episode)
        assert_equal(guest_count, episode.guests.size)
      end
    end
  end
end
