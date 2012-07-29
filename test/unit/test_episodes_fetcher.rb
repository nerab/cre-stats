require 'helper'

class TestEpisodesFetcher < MiniTest::Unit::TestCase
  include CRE::Stats
  include CRE::Stats::Resources

  def setup
    @episodes = mocked('setup'){Episodes.new(Fetcher.new)}
  end

  def test_size
    assert_equal(194, @episodes.count)
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
        episode = @episodes.find(id)
        assert(episode)
        assert_equal(guest_count, episode.guests.size)
      end
    end
  end

  def test_find_by_guest_maha
    maha = @episodes.find_by_guest('Martin Haase')
    assert_equal(5, maha.size)
    assert(maha.none?{|e| e.title == 'CRE042 OpenMoko'})
    [
      'CRE041 Sprachen',
      #'CRE043 Wikipedia für Fortgeschrittene',
      #'CRE081 Neusprech im Schnüffelstaat',
      #'CRE093 Qualitätsmanagement in der Wikipedia',
      'CRE190 Rhetorik',
    ].each do |title|
      assert(maha.any?{|e| e.title == title})
    end
  end

  def test_find_by_guest_ck
    ck = @episodes.find_by_guest('Constanze Kurz')
    assert_equal(3, ck.size)
    assert(ck.none?{|e| e.title == 'CRE057 BitTorrent'})
    [
      'CRE047 Der Elektronische Reisepass',
      'CRE050 Der Wahlstift',
      'CRE058 24C3 Preview',
    ].each do |title|
      assert(ck.any?{|e| e.title == title})
    end
  end
end
