require 'helper'
require 'date'

class TestGrouping < MiniTest::Unit::TestCase
  include CRE::Stats

  def setup
    @dates = []
    (2011..2013).each do |year|
      (1..12).each do |month|
        (1..31).each do |day|
          begin
            @dates << Date.new(year, month, day)
          rescue ArgumentError
            # ignore invalid dates
          end
        end
      end
    end
    assert_equal(1096, @dates.count)
  end

  def test_by_month_single
    date = Date.new(1970, 8, 8)
    grouping = Grouping.get(:month)
    assert(grouping)
    assert(grouping.apply(date))
    assert(grouping.apply(date))
    assert_equal('1970-08', grouping.apply(date))
  end

  def test_by_month
    by_month = Grouping.get(:month)
    grouped = @dates.group_by{|d| by_month.apply(d)}
    assert_equal(36, grouped.keys.count)
    assert(grouped['2011-01'])
    assert_equal(31, grouped['2011-01'].count)
    assert_equal(28, grouped['2011-02'].count)
    assert_equal(29, grouped['2012-02'].count)
  end
end
