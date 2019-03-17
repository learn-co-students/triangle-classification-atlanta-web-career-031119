class Triangle
  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def triangle_inequality?(array)
    array_sum = array.inject(0){|sum,x| sum + x }
    array.any? {|x| array_sum - x <= x}
  end

  def equilateral?(array)
    array[0] == array[1] && array[0] == array[2] ? true : false
  end

  def isosceles?(array)
    array[0] == array[1] || array[0] == array[2] || array[1] == array[2] ? true : false
  end

  def kind
    side_array = [@side_1, @side_2, @side_3]
    if side_array.any? {|x| x == 0} || triangle_inequality?(side_array)
      raise TriangleError
    elsif equilateral?(side_array)
      :equilateral
    elsif isosceles?(side_array)
      :isosceles
    else
      :scalene
    end

  end

  class TriangleError < StandardError

  end
end
