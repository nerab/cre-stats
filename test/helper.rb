require 'minitest/autorun'
require 'cre-stats'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

class MiniTest::Unit::TestCase
  def fixture(name)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', name))
  end

  def mocked(cassette, &block)
    VCR.use_cassette("#{self.class.name}_#{cassette}", :record => :new_episodes){block.call}
  end
end

#
# Allow some better expressiveness
#
class Fixnum
  def hour
    minute * 60
  end
  alias hours hour

  def minute
    to_i * 60
  end
  alias minutes minute

  alias second to_i
  alias seconds second
end

class NullFetcher
  def episodes
    ''
  end
end
