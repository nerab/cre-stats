#
# All but #median adapted from https://gist.github.com/284694
#
# TODO Blocks that allow to call methods on i
# e.g. like this: http://stackoverflow.com/a/5785120
module Enumerable
  def sum
    inject(0){|acc, i| acc + i}
  end

  def average
    sum / count.to_f
  end

  def median
    return nil if empty?

    mid = count / 2
    sorted = to_a.sort

    if count.odd?
      sorted[mid]
    else
      (sorted[mid - 1] + sorted[mid]).to_f / 2.0
    end
  end

  def variance
    sum = inject(0){|acc, i| acc + (i - average) ** 2}
    1 / count.to_f * sum
  end

  def standard_deviation
    Math.sqrt(variance)
  end
end
