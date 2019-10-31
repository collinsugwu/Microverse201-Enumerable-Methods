require './enumerable_methods.rb'

describe 'my_each' do
  it 'should not be empty' do
    expect([1, 2, 3].my_each { |i| i }).not_to be_empty
  end

  it 'should return an enum' do
    expect([1, 2, 3].my_each).to be_instance_of(Enumerator)
  end

  it 'should return an array' do
    expect([1, 2, 3].my_each).to match_array([3, 2, 1])
  end
end

describe 'my_each_with_index' do
  it 'should return an enum' do
    expect([1, 2, 3].my_each_with_index).to be_instance_of(Enumerator)
  end

  it 'should return an array' do
    expect([1, 2, 3].my_each_with_index).to match_array([[1, 0], [2, 1], [3, 2]])
  end
end

describe 'my_select' do
  it 'should return an enum' do
    expect([1, 2, 3].my_select).to be_instance_of(Enumerator)
  end

  it 'should select odd' do
    expect([1, 2, 3].my_select(&:odd?)).to match_array([1, 3])
  end
end

describe 'my_any' do
  it 'should return true' do
    expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to be true
  end

  it 'should return false' do
    expect(%w[ant bear cat].my_any?(/d/)).to be false
  end
end

describe 'my_all' do
  it 'should return true' do
    expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to be true
  end

  it 'should return false' do
    expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to be false
  end
end

describe 'my_none' do
  it 'should return true' do
    expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to be true
  end

  it 'should return false' do
    expect([nil, false, true].my_none?).to be false
  end
end