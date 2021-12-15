# frozen_string_literal: true

# custom enumerables
module Enumerable
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length do
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    array = []
    my_each  { |num| array << num if yield(num) == true}
    array
  end

  def my_all?(argument = true)
    if block_given?
      # code
    end
    my_each do |element| 
      return false unless element
    end
    true
  end
end
