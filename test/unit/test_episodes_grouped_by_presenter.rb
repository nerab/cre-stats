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
    assert_equal(13, parsed['episodes']['by_year']['2005']['episodes']['count'])
  end

  def test_by_month
    presented = Jbuilder.encode do |json|
      EpisodesGroupedByPresenter.to_json(json, @episodes.group_by{|e| "#{e.released_at.year}-#{e.released_at.month}"}, :month)
    end

    parsed = MultiJson.load(presented, :symbolize_keys => false)
    assert_equal(1, parsed['episodes']['by_month']['2005-12']['episodes']['count'])
  end

  def test_by_quarter
    presented = Jbuilder.encode do |json|
      EpisodesGroupedByPresenter.to_json(json, @episodes.group_by{|e| "#{e.released_at.year}-#{e.released_at.quarter}"}, :quarter)
    end

    parsed = MultiJson.load(presented, :symbolize_keys => false)
    assert_equal(1, parsed['episodes']['by_quarter']['2011-1']['episodes']['count'])
  end
end
