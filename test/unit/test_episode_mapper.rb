require 'helper'

class TestEpisodeMapper < MiniTest::Unit::TestCase
  include CRE::Stats::Mappers

  def setup
    doc = Nokogiri::HTML(fixture('cre193.html'))
    @episode = EpisodeMapper.load(doc.xpath('/html/body/tr').first)
  end

  def test_load_success
    refute_nil(@episode)
  end
end
