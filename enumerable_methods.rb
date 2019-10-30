# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield self[i], i if block_given?
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    if block_given?
      my_each { |i| result << i if yield(i) }
    end
    result
  end

  def my_any?(patern = nil)
    any = false
    if block_given?
      my_each { |i| any = true if yield i }
    elsif patern
      my_each { |i| any = true if patern === i }
    else
      my_each { |i| any = true if i }
    end
    any
  end

  def my_all?(patern = nil)
    all = true
    if block_given?
      my_each { |i| all &= yield i }
    elsif patern
      my_each { |i| all &= patern === i }
    else
      my_each { |i| all &= i }
    end
    all
  end

  def my_none?(pattern = nil, &a_block)
    !my_any?(pattern, &a_block)
  end

  def my_count(things = nil)
    counter = 0
    if block_given?
      my_each { |x| counter += 1 if yield(x) == true }
    elsif things.nil?
      my_each { counter += 1 }
    else
      my_each { |x| counter += 1 if x == things }
    end
    counter
  end

  def my_map
    return to_enum :my_map unless block_given?

    result = []
    my_each { |element| result << yield(element) }
    result
  end

  def my_inject(*args)
    arr = to_a.dup
    if args[0].nil?
      numn = arr.shift
    elsif args[1].nil? && !block_given?
      symbol = args[0]
      numn = arr.shift
    elsif args[1].nil? && block_given?
      numn = args[0]
    else
      numn = args[0]
      symbol = args[1]
    end

    arr[0..-1].my_each do |i|
      numn = if symbol
               numn.send(symbol, i)
             else
               yield(numn, i)
             end
    end
    numn
  end
end

def multiply_els(arr)
  arr.my_inject { |memo, val| memo * val }
end
