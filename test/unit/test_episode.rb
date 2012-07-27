require 'helper'

class TestEpisode < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @episode = Episode.new
  end

  def test_thumbnail
    @episode.thumbnail = URI('http://cre.fm/files/2012/07/cre194-bier-150x150.jpg')
    assert_equal('/files/2012/07/cre194-bier-150x150.jpg', @episode.thumbnail.request_uri)
    assert(@episode.invalid?)
  end

  def test_release_date
    @episode.released_at = Date.parse('02.07.2012')
    assert_equal(Date.new(2012, 7, 2), @episode.released_at)
    assert(@episode.invalid?)
  end

  def test_title
    title = 'CRE194 Bier'
    @episode.title  = title
    assert_equal(title, @episode.title)
    assert(@episode.invalid?)
  end

  def test_subtitle
    st = 'Bierkultur und Hobbybrauerei'
    @episode.subtitle = st
    assert(@episode.subtitle =~ /#{st}/)
    assert(@episode.invalid?)
  end

  def test_url
    @episode.uri = URI("http://cre.fm/cre194")
    assert_equal('/cre194', @episode.uri.request_uri)
    assert(@episode.invalid?)
  end

  def test_guests
    assert_empty(@episode.guests)
    bogk = 'Andreas Bogk'
    @episode.guests << bogk
    refute_empty(@episode.guests)
    assert_equal(bogk, @episode.guests.first)
    assert(@episode.invalid?)
  end

  def test_duration
    dur = '03:13:52'
    @episode.duration = dur
    assert_equal(dur, @episode.duration)
    assert(@episode.invalid?)
  end
end

