require_relative 'enumerable'

class MyList
  include MyEnumerable
  def initialize(*args)
    @list = args
  end

  def each(&block)
    @list.each(&block) if block_given?
  end
end

# Create our list
list = MyList.new(1, 3, 2, 4)
# => #<MyList: @list=[1, 2, 3, 4]>

# Test #all?
less_than_five = list.all? { |e| e < 5 }
# => true
greater_than_five = list.all? { |e| e > 5 }
# => false

# Test #any?
include_two = list.any? { |e| e == 2 }
# => true
include_five = list.any? { |e| e == 5 }
# => false

# Test #filter
all_evens = list.filter(&:even?)
# => [2, 4]

sort_list = list.sort()

puts less_than_five, greater_than_five, all_evens, include_two, include_five, sort_list, list.max, list.min
