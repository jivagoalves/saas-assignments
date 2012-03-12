class CartesianProduct
  include Enumerable

  def initialize(x = nil, y = nil)
    @x = x
    @y = y
  end

  def elements
    result = []
    @x.each do |elt_x|
      @y.each do |elt_y|
        result << [elt_x,elt_y] unless result.include?([elt_x,elt_y])
      end
    end
    result
  end

  def each
    elements.each { |e| yield e }
  end
end
