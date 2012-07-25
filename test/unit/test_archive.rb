require 'helper'

class TestArchive < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    doc = Nokogiri::HTML(fixture('all.html'))
    @archive = Archive.new(doc.xpath('/html/body/tr'))
  end

  def test_empty
    refute_nil(@archive)
    assert_equal(193, @archive.episodes.size)
  end
end
