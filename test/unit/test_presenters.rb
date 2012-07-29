require 'helper'

class TestPresenters < MiniTest::Unit::TestCase
  include CRE::Stats
  include CRE::Stats::Resources
  include CRE::Stats::Presenters

  def setup
    @episodes = mocked('setup'){Episodes.new(Fetcher.new)}
  end

  def test_find_root
    assert_equal(RootPresenter, Presenters.find)
    assert_equal(RootPresenter, Presenters.find(''))
  end

  def test_find_episodes
    assert_equal(EpisodesPresenter, Presenters.find('episodes'))
    assert_equal(EpisodesPresenter, Presenters.find(:episodes))
  end

  def test_find_guests
    assert_equal(GuestsPresenter, Presenters.find('guests'))
    assert_equal(GuestsPresenter, Presenters.find(:guests))
  end

  def test_find_comments
    assert_equal(CommentsPresenter, Presenters.find('comments'))
    assert_equal(CommentsPresenter, Presenters.find(:comments))
  end

  def test_root
    assert_equal(194, @episodes.count)

    result = Jbuilder.encode do |json|
      RootPresenter.to_json(json, @episodes)
    end

    skip 'Add assertions'
  end
end
