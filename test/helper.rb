require 'minitest/autorun'
require 'cre-stats'

class MiniTest::Unit::TestCase
  def fixture(name)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', name))
  end
end
