module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index +=1
    end
  end

  def my_map
    final_array = []
    for element in self
      final_array << yield(element)
    end
    final_array
  end

  def my_inject(initial_value)
    accumulator = initial_value
    for element in self
      accumulator = yield(accumulator, element)
    end
    accumulator
  end

  def my_any?
    flag = false
    self.my_each do |element|
      if yield(element) == true
        flag = true
      end
    end
    flag
  end

  def my_all?
    self.my_each do |element|
      if yield(element) == false
        return false
      end
    end
    true
  end
  
  def my_count
    counter = 0
    unless block_given?
      self.my_each do |element|
        counter += 1
      end
    else
      self.my_each do |element|
        if yield(element)
          counter += 1
        end
      end
    end
    counter
  end

  def my_none?
    self.my_each do |element|
      if yield(element)
        return false
      end
    end
    true    
  end

  def my_select
    final_array = Array.new(0)
    self.my_each do |element|
      if yield(element)
        final_array << element
      end
    end
    final_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element)
    end
  end

end

#enumerable = [1, 1, 2, 3, 5, 8, 13, 21, 34]
#enumerable.my_all? { |value| value > 0 }