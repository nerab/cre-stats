require 'helper'

class TestArchive < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    doc = Nokogiri::HTML(fixture('all.html'))
    trs = doc.xpath("//tr[@class='podcast_archive_element']")
    @archive = Archive.new(trs)
  end

  def test_empty
    refute_nil(@archive)
    assert_equal(194, @archive.episodes.size)
  end
end
