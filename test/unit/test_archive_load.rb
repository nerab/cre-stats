require 'helper'

class TestArchiveLoad < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @archive = mocked('setup'){Archive.load}
  end

  def test_size
    assert_equal(194, @archive.episodes.size)
  end
end
