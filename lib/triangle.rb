require 'pry'

class Triangle

  attr_accessor :side1, :side2, :side3



  def initialize (side1, side2, side3)
    @triangle = []
    @triangle << side1
    @triangle << side2
    @triangle << side3
  end

  def valid?
    sum_one_two = @triangle[0] + @triangle[1]
    sum_one_three = @triangle[0] + @triangle[2]
    sum_two_three = @triangle[1] + @triangle[2]

    @triangle.none?{|s| s <= 0} && sum_one_two > @triangle[2] && sum_one_three > @triangle[1] && sum_two_three > @triangle[0]
  end

  # @side1 == @side2 && @side2 == @side3
  # @side1 != @side2 && @side2 != @side3 && @side3 != @side1

  def kind
    if valid?
      if @triangle.uniq.length == 1
        :equilateral
      elsif @triangle.uniq.length == 2
        :isosceles
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError

  end
end




