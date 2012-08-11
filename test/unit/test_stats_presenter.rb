require 'helper'

class TestStatsPresenters < MiniTest::Unit::TestCase
  include CRE::Stats::Presenters, HMS

  def test_duration
    durations = [5.0, 10.0, 15.0].map{|f| Duration.new(f)}

    presented = Jbuilder.encode do |json|
      StatsPresenter.to_json(json, durations)
    end

    parsed = MultiJson.load(presented, :symbolize_keys => true)

    assert_equal(10.0, Duration.new(parsed[:mean]))
  end
end
