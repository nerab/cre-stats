require 'helper'

class TestEnumerableStats < MiniTest::Unit::TestCase
  def test_sum
    assert_equal(15, (1..5).to_a.sum) # 1 + 2 + 3 + 4 + 5
    assert_equal(1, [1].sum)
    assert_equal(4, [2, 2].sum)
    assert_equal(9.0, [2.0, 3.0, 4.0].sum)
  end

  def test_average
    assert_equal(5, (0..10).to_a.average)
    assert_equal(1, [1].average)
    assert_equal(2, [2, 2].average)
    assert_equal(3.0, [2.0, 3.0, 4.0].average)
  end

  def test_variance
    # s'² in https://de.wikipedia.org/wiki/Stichprobenvarianz
    assert_in_delta(0.8353, [-0.8223, -0.2789, -0.2537, 1.1041,  1.5785].variance, 0.0001)
  end

  def test_standard_deviation
    samples = [114.3, 135.7, 104.8, 118.5, 125.7, 121.4, 122.4,  96.8, 118.9, 120  , 112.2, 127.9, 122.8, 128.9, 120.3]
    assert_in_delta(119.373, samples.average, 0.001)
    assert_in_delta(86.42862, samples.variance, 0.0001)
    assert_in_delta(9.296699, samples.standard_deviation, 0.00001)
  end

  def test_median
    # test data from http://stackoverflow.com/a/11332640
    samples = [0,  1,  2,  3,  4,  5,  6,  7,  8,  9, -1, -2, -3, -4, -5, -6, -7, -8, -9]
    assert_in_delta(0, samples.median, 0.0001)

    samples = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
    assert_in_delta(9, samples.median, 0.0001)
  end
end
