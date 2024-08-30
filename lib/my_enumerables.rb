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
    self.my_each do |elem|
      return elem if yield(elem)
    end
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
