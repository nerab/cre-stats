require 'helper'

class TestEpisodes < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @archive = Episodes.new(NullFetcher.new)
  end

  def test_empty
    refute_nil(@archive)
    assert_equal(0, @archive.count)
  end
end
