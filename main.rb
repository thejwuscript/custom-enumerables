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

  def my_all?(*args)
    if block_given?
      my_each do |element|
        return false unless yield(element) == true
      end
      return true
    end
    my_each do |element| 
      if args.empty?
        return false unless element
        next
      else
        return false unless args[0] === element
        next
      end
    end
    true
  end
end
