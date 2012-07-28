require 'helper'

class TestPresenters < MiniTest::Unit::TestCase
  include CRE::Stats
  include CRE::Stats::Presenters

  def setup
    @episodes = mocked('setup'){Episodes.new(Fetcher.new)}
  end

  def test_root
    assert_equal(194, @episodes.count)

    result = Jbuilder.encode do |json|
      Presenter.to_json(json, @episodes)
    end

#    STDERR.puts result

  end
end
