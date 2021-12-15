# frozen_string_literal: true

# custom enumerables
module Enumerable
  def my_each
    self.to_a.length.times do |i|
      yield(self.to_a[i])
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

  # With no block given and no argument, returns true if self has no truthy elements, false otherwise.
  def my_none?(*args)
    if block_given?
      my_each { |item| return false if yield(item) == true}
    elsif args.empty?
      my_each { |item| return false if item}
    else
      my_each { |item| return false if args[0] === item}
    end
    true
  end

  def my_count(*args)
    counter = 0
    if block_given? && args.my_any?
      puts "warning: given block not used"
      my_each { |item| counter += 1 if item == args[0] }
    elsif block_given?
       my_each { |item| counter += 1 if yield(item) == true }
    elsif args.empty?
      return length
    else
      my_each { |item| counter += 1 if item == args[0] }
    end
    counter
  end

  def my_map
    array = []
    my_each { |item| array << yield(item) }
    array
  end

  def my_inject(*args)
    accumulator = to_a[0]
    self.to_a[1..-1].my_each do |item| 
      accumulator = item.send args[0], accumulator
    end
    accumulator
  end
end
