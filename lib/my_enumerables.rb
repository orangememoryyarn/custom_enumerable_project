module Enumerable
  # Your code goes here
  def my_each_with_index
    index=0
    self.my_each do |elem|
      yield elem, index
      index = index + 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr.push(elem) if yield(elem)
    end
    arr
  end

  def my_all?
    match = true
    self.my_each do |elem|
      match = false unless yield(elem)
    end
    match
  end

  def my_count
    return self.length unless block_given?

    count = 0
    self.my_each do |elem|
      count+=1 if yield(elem)
    end
    count
  end

  def my_any?
    match = false
    self.my_each do |elem|
      match = true if yield(elem)
    end
    match
  end

  def my_none?
    match = true
    self.my_each do |elem|
      match = false if yield(elem)
    end
    match
  end

  def my_map
    arr = Array.new()
    self.my_each do |elem|
      arr.push(yield (elem))
    end
    arr
  end

  def my_inject(value)
    self.my_each do |elem|
      value = yield(elem, value)
    end
    value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield elem
    end
    self
  end


end
