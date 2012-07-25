require 'helper'

class TestArchive < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @archive = Archive.new
  end

  def test_empty
    refute_nil(@archive)
    assert_equal(0, @archive.episodes.size)
  end
end
