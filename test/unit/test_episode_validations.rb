require 'helper'

class TestEpisodeValidations < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @episode = Episode.new

    # assign all fields with valid values
    @episode.id  = 194
    @episode.thumbnail = URI('http://cre.fm/files/2012/07/cre194-bier-150x150.jpg')
    @episode.released_at = Date.parse('02.07.2012')
    @episode.title  = 'CRE194 Bier'
    @episode.subtitle = 'Bierkultur und Hobbybrauerei'
    @episode.uri = URI("http://cre.fm/cre194")
    @episode.guests << 'Andreas Bogk'
    @episode.duration = 11650
  end

  def test_valid
    refute(@episode.invalid?, @episode.errors.full_messages.join(', '))
    assert(@episode.valid?)
  end

  def test_invalid_thumbnail
    @episode.thumbnail = nil
    assert(@episode.invalid?)

    @episode.thumbnail = ''
    assert(@episode.invalid?)

    @episode.thumbnail = '\/BAD'
    assert(@episode.invalid?, 'Must not accept malformed thumbnail URI')
    assert_match(@episode.errors[:thumbnail].first, /bad URI/)
  end

  def test_invalid_released_at
    @episode.released_at = nil
    assert(@episode.invalid?)

    @episode.released_at = ''
    assert(@episode.invalid?)
  end

  def test_invalid_title
    @episode.title = nil
    assert(@episode.invalid?)
  end

  def test_invalid_subtitle
    @episode.subtitle = nil
    assert(@episode.invalid?)
  end

  def test_invalid_uri
    @episode.uri = nil
    assert(@episode.invalid?)

    @episode.uri = '\/BAD'
    assert(@episode.invalid?, 'Must not accept malformed URI')
    assert_match(@episode.errors[:uri].first, /bad URI/)
  end

  def test_invalid_duration
    @episode.duration = nil
    assert(@episode.invalid?)

    @episode.duration = ''
    assert(@episode.invalid?)

    @episode.duration = 0
    assert(@episode.invalid?, 'Must be invalid')

    @episode.duration = 1
    assert(@episode.valid?, @episode.errors.full_messages.join(', ')) # all is good again
  end
end
