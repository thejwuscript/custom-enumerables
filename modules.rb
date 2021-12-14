module Enumerable
  def my_each
    yield(self[0..6])
  end

  def my_each_with_index
    i = 0
    while i < self.length do
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    ary = []
    for i in 0..self.length-1
      ary << self[i] if yield(self[i]) == true
    end
    ary
  end

  
  def my_selectalt
    my_each {|num| num.odd?}
  end

end
