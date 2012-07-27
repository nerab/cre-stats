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

  private

  def assert_construction(str, int)
    d = Duration.new(int)
    assert_equal(int, d.to_i)
    assert_equal(str, d.to_s)
  end

  def assert_parts(hours, minutes, seconds, dur)
    d = Duration.new(dur)

    assert_equal(hours, d.hours)
    assert_equal(minutes, d.minutes)
    assert_equal(seconds, d.seconds)
  end
end
