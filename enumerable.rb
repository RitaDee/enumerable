module MyEnumerable
  def all?()
    each { |item| return false unless yield(item) } if block_given?
    true
  end

  def any?()
    each { |item| return true if yield(item) } if block_given?
    false
  end

  def filter()
    result = []
    each { |item| result << item if yield(item) } if block_given?
    result
  end

  def max(&block)
    return @list.max(&block) if block_given?

    @list.max
  end

  def min(&block)
    return @list.min(&block) if block_given?

    @list.min
  end

  def sort(&block)
    sorted_list = block_given? ? @list.sort(&block) : @list.sort
    puts sorted_list.join(", ")
    MyList.new(*sorted_list)
  end
end
