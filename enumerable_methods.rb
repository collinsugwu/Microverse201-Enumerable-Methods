# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield self[i] if block_given?
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i if block_given?
      i += 1
    end
  end

  def my_select
    result = []
    if block_given?
      my_each { |i| result << i if yield(i) }
    end
    result
  end

  def my_any?(patern = false)
    any = false
    my_each do |i|
      if block_given?
        any = true if yield(i)
      elsif patern == true
        any = false if (patern == i) == false
      else
        any = false unless i != false
      end
    end
    any
  end

  def my_all?(patern = false)
    all = true
    my_each do |i|
      if block_given?
        all = false if yield(i) == false
      elsif patern == true
        all = false if patern == i
      else
        all = false unless i != false
      end
    end
    all
  end

  def my_none?(partern = false)
    result = true
    my_each do |i|
      if block_given?
        result = false if yield(i)
      elsif partern == true
        result = false if (partern == i) == false
      else
        result = false unless i != false
      end
    end
    result
  end

  def my_count
    i = 0
    if block_given?
      my_each { i += 1 }
    else
      i = length
    end
    i
  end

  def my_map(&my_proc)
    result = []
    if block_given?
      my_each { |element| result << my_proc.call(element) }
    else
      result = self
    end
    result
  end

  def my_inject(memo = nil)
    memo ||= self[0]
    my_each { |val| memo = yield memo, val } if block_given?
    memo
  end
end

def multiply_els(arr)
  arr.my_inject { |memo, val| memo * val }
end
my_proc = proc { |i| i.upcase }
numb = [2, 5, 7, 6, 1]
name = %w[collins ada]

numb.my_each { |i| puts "squre of number: #{i} ** 2 = #{i**2}" }
numb.my_each_with_index { |element, index| puts "index: #{index} and element: #{element}" }
select = numb.my_select(&:odd?)
print select
all = numb.my_all? { |i| i < 8 }
puts all
any = name.my_any? { |i| i.is_a? Integer }
puts any
none = numb.my_none? { |i| i == 10 }
print none
puts numb.my_count
print name.my_map(&my_proc)
puts multiply_els(numb)
