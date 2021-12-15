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
      my_each { |item| return false unless yield(item) == true}
    elsif args.empty?
      my_each { |item| return false unless item}
    else
      my_each { |item| return false unless args[0] === item}
    end
    true
  end

  def my_any?(*args)
    if block_given?
      my_each { |item| return true if yield(item) == true}
    elsif args.empty?
      my_each { |item| return true if item}
    else
      my_each { |item| return true if args[0] === item}
    end
    false
  end
end
