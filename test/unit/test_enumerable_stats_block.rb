require 'helper'

class Person
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  def <=>(other)
    @age <=> other.age
  end
end

class TestEnumerableStatsWithBlock < MiniTest::Unit::TestCase
  def test_stats_example1
    # test data example1 from http://web.cs.wpi.edu/~claypool/misc/stats/stats.txt
    samples = [5.0, 10.0, 15.0].map{|f| Person.new(f)}
    assert_in_delta(10.0, samples.mean{|p| p.age}, 1e-6)
    assert_in_delta(25.0, samples.variance{|p| p.age}, 1e-6)
    assert_in_delta(5.0, samples.standard_deviation{|p| p.age}, 1e-6)
    assert_in_delta(30.0, samples.sum{|p| p.age}, 1e-6)

    # not really testing out impl here, but the original tests this, too
    assert_in_delta(5.0, samples.map{|p| p.age}.min, 1e-6)
    assert_in_delta(15.0, samples.map{|p| p.age}.max, 1e-6)
  end

  def test_stats_example2_f2
    # test data example2 from http://web.cs.wpi.edu/~claypool/misc/stats/stats.txt
    samples = [20.0, 40.0, 31.0].map{|f| Person.new(f)}

    assert_in_delta(30.333333333333,  samples.mean{|p| p.age}, 1e-6)
    assert_in_delta(100.333333333333, samples.variance{|p| p.age}, 1e-6)
    assert_in_delta(10.016652800878,  samples.standard_deviation{|p| p.age}, 1e-6)
    assert_in_delta(91.000000000000,  samples.sum{|p| p.age}, 1e-6)
    assert_in_delta(20.000000000000,  samples.map{|p| p.age}.min, 1e-6)
    assert_in_delta(40.000000000000,  samples.map{|p| p.age}.max, 1e-6)
  end

  def test_stats_example2_f4
    # test data example2 from http://web.cs.wpi.edu/~claypool/misc/stats/stats.txt
    samples = [10.2, 19.3, 15.4].map{|f| Person.new(f)}

    assert_in_delta(14.966666666667, samples.mean{|p| p.age}, 1e-6)
    assert_in_delta(20.843333333333, samples.variance{|p| p.age}, 1e-6)
    assert_in_delta(4.565449959570,  samples.standard_deviation{|p| p.age}, 1e-6)
    assert_in_delta(44.900000000000, samples.sum{|p| p.age}, 1e-6)
    assert_in_delta(10.200000000000, samples.map{|p| p.age}.min, 1e-6)
    assert_in_delta(19.300000000000, samples.map{|p| p.age}.max, 1e-6)
  end

  def test_median
    # test data from http://stackoverflow.com/a/11332640
    samples = [0,  1,  2,  3,  4,  5,  6,  7,  8,  9, -1, -2, -3, -4, -5, -6, -7, -8, -9].map{|f| Person.new(f)}
    assert_in_delta(0, samples.median{|p| p.age}, 1e-6)

    samples = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18].map{|f| Person.new(f)}
    assert_in_delta(9, samples.median{|p| p.age}, 1e-6)
  end
end
