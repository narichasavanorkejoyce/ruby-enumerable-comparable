# frozen_string_literal: true

#
class SteppedRange
  include Enumerable
  attr_reader :start, :stop, :step
  # code outside this class cannot access start, stop, step
  private :start, :stop, :step
  # this uniquely defines the stepped range
  def initialize(start, stop, step)
    @start = start
    @stop = stop
    @step = step
  end

  # we are going to provide a block of code that will be applied to each item
  def each
    current = start
    while current <= stop
      # yield says, "hey, what's the value of the current value?"
      # Kind of like return
      yield current
      current += step
    end
  end
end

# myRange = SteppedRange.new(1, 10, 3).to_a --> [1, 4, 7, 10]
