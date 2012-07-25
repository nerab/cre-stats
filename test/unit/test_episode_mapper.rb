require 'helper'

class TestEntity < MiniTest::Unit::TestCase
  include CRE::Stats::Mappers

  def setup
    @episode = EpisodeMapper.load(fixture('cre193.html'))
  end

  def test_load_success
    skip 'TBD'
    refute_nil(@episode)
  end
end
