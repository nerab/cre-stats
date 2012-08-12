require 'helper'

class TestQuarter < MiniTest::Unit::TestCase
  def test_q1
    assert_quarter(1, '2012-01-01 00:00:00')
    assert_quarter(1, '2012-02-01 00:04:10')
    assert_quarter(1, '2012-03-31 23:59:59')
  end

  def test_q2
    assert_quarter(2, '2012-04-01 00:00:00')
    assert_quarter(2, '2012-05-01 00:04:10')
    assert_quarter(2, '2012-06-30 23:59:59')
  end

  def test_q3
    assert_quarter(3, '2012-07-01 00:00:00')
    assert_quarter(3, '2012-08-14 23:04:10')
    assert_quarter(3, '2012-09-30 23:59:59')
  end

  def test_q4
    assert_quarter(4, '2012-10-01 00:00:00')
    assert_quarter(4, '2012-11-07 14:49:10')
    assert_quarter(4, '2012-12-31 23:59:59')
  end

  private

  def assert_quarter(expected, date_str)
    assert_equal(expected, DateTime.parse(date_str).quarter)
  end
end
