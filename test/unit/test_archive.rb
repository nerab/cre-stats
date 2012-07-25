require 'helper'

class TestArchive < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    doc = XML::HTMLParser.string(fixture('all.html')).parse
    @archive = Archive.new(doc.find('/html/body/tr'))
  end

  def test_empty
    refute_nil(@archive)
    assert_equal(193, @archive.episodes.size)
  end
end
