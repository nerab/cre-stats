require 'date'

class Date
  def quarter
    [1..3, 4..6, 7..9, 10..12].each_with_index do |q, i|
      return i + 1 if q.member?(month)
    end
    raise ArgumentError, "Cannot determine quarter for #{self.inspect}"
  end
end
