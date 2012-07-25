require 'helper'

class TestEpisodeValidations < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @episode = Episode.new
    @episode.thumbnail = URI('http://cre.fm/files/2012/07/cre194-bier-150x150.jpg')
    @episode.released_at = Date.parse('02.07.2012')
    @episode.title  = 'CRE194 Bier'
    @episode.subtitle = 'Bierkultur und Hobbybrauerei'
    @episode.uri = URI("http://cre.fm/cre194")
    @episode.guests << 'Andreas Bogk'
    @episode.duration = '03:13:52'
  end

  def test_valid
    refute(@episode.invalid?)
    assert(@episode.valid?)
  end
end

