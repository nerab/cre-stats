#
# All but #median adapted from https://gist.github.com/284694
#
# TODO Call block instead of just using i
# e.g.
#    inject(0){|acc, i| acc + (block_given? ? yield(i) : i)}
# Test with
# puts [1, 2, 3].sum
# puts %w{one two three}.sum{|word| word.length}
#
module Enumerable
  def sum
    inject(0){|acc, i| acc + (block_given? ? yield(i) : i)}
  end

  def average(&block)
    sum(&block) / count.to_f
  end

  alias :mean :average

  def median
    return nil if empty?

    mid = count / 2
    sorted = to_a.sort

    if count.odd?
      (block_given? ? yield(sorted[mid]) : sorted[mid])
    else
      if block_given?
        (yield(sorted[mid - 1]) + yield(sorted[mid])).to_f / 2.0
      else
        (sorted[mid - 1] + sorted[mid]).to_f / 2.0
      end
    end
  end

  def variance(&block)
    return 0 if empty?
    (sum_sq(&block) - ((sum(&block) ** 2) / count)) / (count - 1)
  end

  def standard_deviation(&block)
    var = variance(&block)

    if (count > 1 && var != 0)
      Math.sqrt(var)
    else
      0.0
    end
  end

  private

  def sum_sq
    self.inject(0){|acc, i| acc + (block_given? ? yield(i) : i) ** 2}
  end
end
