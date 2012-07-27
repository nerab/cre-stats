require 'helper'

class TestDuration < MiniTest::Unit::TestCase
  include CRE::Stats

  def test_initial
    d = Duration.new
    assert_equal(0, d.to_i)
    assert_equal('00:00:00', d.to_s)
  end

  def test_zero
    sec = 0
    assert_construction('00:00:00', sec)
    assert_parts(0, 0, 0, sec)
  end

  def test_1_sec
    sec = 1.second
    assert_construction('00:00:01', sec)
    assert_parts(0, 0, 1, sec)
  end

  def test_59_sec
    sec = 59.seconds
    assert_construction('00:00:59', sec)
    assert_parts(0, 0, 59, sec)
  end

  def test_60_sec
    sec = 1.minute
    assert_construction('00:01:00', sec)
    assert_parts(0, 1, 0, sec)
  end

  def test_61_sec
    sec = 1.minute + 1.seconds
    assert_construction('00:01:01', sec)
    assert_parts(0, 1, 1, sec)
  end

  def test_3_min_59_sec
    sec = 3.minutes + 59.seconds
    assert_construction('00:03:59', sec)
    assert_parts(0, 3, 59, sec)
  end

  def test_3_min_60_sec
    sec = 3.minutes + 60.seconds
    assert_construction('00:04:00', sec)
    assert_parts(0, 4, 0, sec)
  end

  def test_3_min_61_sec
    sec = 3.minutes + 61.seconds
    assert_construction('00:04:01', sec)
    assert_parts(0, 4, 1, sec)
  end

  def test_59_min_59_sec
    sec = 59.minutes + 59.seconds
    assert_construction('00:59:59', sec)
    assert_parts(0, 59, 59, sec)
  end

  def test_59_min_60_sec
    sec = 59.minutes + 60.seconds
    assert_construction('01:00:00', sec)
    assert_parts(1, 0, 0, sec)
  end

  def test_59_min_61_sec
    sec = 59.minutes + 61.seconds
    assert_construction('01:00:01', sec)
    assert_parts(1, 0, 1, sec)
  end

  def test_1_hr_59_sec
    sec = 1.hour + 59.seconds
    assert_construction('01:00:59', sec)
    assert_parts(1, 0, 59, sec)
  end

  def test_1_hr_60_sec
    sec = 1.hour + 60.seconds
    assert_construction('01:01:00', sec)
    assert_parts(1, 1, 0, sec)
  end

  def test_1_hr_61_sec
    sec = 1.hour + 61.seconds
    assert_construction('01:01:01', sec)
    assert_parts(1, 1, 1, sec)
  end

  def test_1_hr_59_min_59_sec
    sec = 1.hour + 59.minutes + 59.seconds
    assert_construction('01:59:59', sec)
    assert_parts(1, 59, 59, sec)
  end

  def test_1_hr_59_min_60_sec
    sec = 1.hour + 59.minutes + 60.seconds
    assert_construction('02:00:00', sec)
    assert_parts(2, 0, 0, sec)
  end

  def test_1_hr_59_min_61_sec
    sec = 1.hour + 59.minutes + 61.seconds
    assert_construction('02:00:01', sec)
    assert_parts(2, 0, 1, sec)
  end

  def test_plus_zero
    assert_equal(0, Duration.new + Duration.new)
    assert_equal(0, Duration.new + 0)
    assert_equal(0, 0 + Duration.new)
  end

  def test_plus_two
    assert_equal(4, Duration.new(2) + Duration.new(2))
    assert_equal(4, Duration.new(2) + 2)
    assert_equal(4, 2 + Duration.new(2))
  end

  def test_minus_zero
    assert_equal(0, Duration.new(2) - Duration.new(2))
    assert_equal(0, Duration.new(2) - 2)
    assert_equal(0, 2 - Duration.new(2))
    assert_equal('00:00:00', (2 - Duration.new(2)).to_s)
  end

  def test_minus_positive
    assert_equal(2, Duration.new(5) - Duration.new(3))
    assert_equal(2, Duration.new(5) - 3)
    assert_equal(2, 5 - Duration.new(3))
    assert_equal('00:00:02', (5 - Duration.new(3)).to_s)
  end

  def test_minus_negative
    assert_equal(-2, Duration.new(5) - Duration.new(7))
    assert_equal(-2, Duration.new(5) - 7)
    assert_equal(-2, 5 - Duration.new(7))

    minus2 = (5 - Duration.new(7))
    assert_parts(0, 0, -2, minus2)
    assert_equal('-00:00:02', minus2.to_s)
  end

  def test_negative_to_s
    assert_equal('-00:00:59', Duration.new(-1.minute + 1.second).to_s)
    assert_equal('-00:01:00', Duration.new(-1.minute).to_s)
    assert_equal('-00:01:08', Duration.new(-1.minute - 8.seconds).to_s)
  end

  def test_compare_zero
    assert_equal(Duration.new, Duration.new)
    assert_equal(0, Duration.new)
    assert_equal(Duration.new, 0)
  end

  def test_compare_positive
    assert_equal(Duration.new(42), Duration.new(42))
    assert_equal(42, Duration.new(42))
    assert_equal(Duration.new(42), 42)
  end

  def test_compare_negative
    assert_equal(Duration.new(-23), Duration.new(-23))
    assert_equal(-23, Duration.new(-23))
    assert_equal(Duration.new(-23), -23)
  end

  def test_equals_zero
    assert(Duration.new == Duration.new)
    assert(0 == Duration.new)
    assert(Duration.new == 0)
  end

  def test_equals_positive
    assert(Duration.new(42) == Duration.new(42))
    assert(42 == Duration.new(42))
    assert(Duration.new(42) == 42)
  end

  def test_equals_negative
    assert(Duration.new(-23) == Duration.new(-23))
    assert(-23 == Duration.new(-23))
    assert(Duration.new(-23) == -23)
  end

  def test_compare_same
    assert_equal(0, Duration.new <=> Duration.new)
    assert_compare_same(0)
    assert_compare_same(42)
    assert_compare_same(-11)
  end

  def test_compare_shorter
    assert_compare_shorter(23, 42)
    assert_compare_shorter(-42, 23)
  end

  def test_compare_longer
    assert_compare_longer(42, 23)
    assert_compare_longer(-23, -42)
  end

  private

  def assert_construction(str, int)
    d = Duration.new(int)
    assert_equal(int, d.to_i)
    assert_equal(str, d.to_s)
  end

  def assert_parts(hours, minutes, seconds, int)
    d = Duration.new(int)

    assert_equal(hours, d.hours, 'Wrong hours')
    assert_equal(minutes, d.minutes, 'Wrong minutes')
    assert_equal(seconds, d.seconds, 'Wrong seconds')
  end

  def assert_compare_same(number)
    assert_equal(0, Duration.new(number) <=> Duration.new(number))
    assert_equal(0, number <=> Duration.new(number))
    assert_equal(0, Duration.new(number) <=> number)
  end

  def assert_compare_shorter(left, right)
    assert(left < right)
    assert(0 > (Duration.new(left) <=> Duration.new(right)))
    assert(0 > (left <=> Duration.new(right)))
    assert(0 > (Duration.new(left) <=> right))
  end

  def assert_compare_longer(left, right)
    assert(left > right)
    assert(0 < (Duration.new(left) <=> Duration.new(right)))
    assert(0 < (left <=> Duration.new(right)))
    assert(0 < (Duration.new(left) <=> right))
  end
end
