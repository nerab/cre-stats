require 'helper'

class TestEpisodeMapper < MiniTest::Unit::TestCase
  include CRE::Stats::Mappers

  def setup
    doc = XML::HTMLParser.string(fixture('cre193.html')).parse
    @episode = EpisodeMapper.load(doc.find_first('/html/body/tr'))
  end

  def test_load_success
    refute_nil(@episode)
  end
end
