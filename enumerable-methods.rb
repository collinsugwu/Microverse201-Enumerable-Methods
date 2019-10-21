module Enumerable
  def my_each 
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
  end
  

  def my_each_with_index  
   i=0;
    for i in i...self.size
      yield(self[i], i)
    end
  end

  def my_select
    result = []
    self.my_each {|i| result << i if yield(i)}
    result
  end
  
  def my_any?
    self.my_each {|i| true if yield(i) }
  end

  def my_all?
    self.my_each {|i| true if yield(i) == true}
  end

  def my_none?
    true unless block_given?
    result = false
    self.my_each {|i| true unless yield(i)}
    result
  end

  def my_count
    i = 0
    self.my_each { i += 1}
    i
  end

  def my_map(&my_proc)
    result = []
      self.my_each {|element| result << my_proc.call(element)}
    result
  end

  def my_inject(acc = nil)
    acc, *b = self
    self.my_each { |i| acc = yield(acc, i) }
    acc
  end
end

my_proc = Proc.new { |i| i.upcase }
array = [2, 5, 7, 6, 1]
name = ["collins",'ada']

array.my_each { |i| puts "squre of number: #{i} ** 2 = #{i ** 2}" }
array.my_each_with_index { |element, index| puts "index: #{index} and element: #{element}" }
array.my_select { |i| puts i.even? }
array.my_all? {|i| puts i <= 5}
name.my_any? {|i| puts i.is_a? Integer}
array.my_none? { |i| puts i == 7 }
puts array.my_count
puts name.my_map(&my_proc)
p array.my_inject { |i, j| i + j }
