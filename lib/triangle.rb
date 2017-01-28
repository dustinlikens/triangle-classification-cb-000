class Triangle

  attr_reader :sides

  def initialize(first,second,third)
    @sides = [first,second,third]
  end
  
  def valid?
    sides.all?{|s|s > 0} && sides.all?{|s|s < sides.inject(:+) - s }
  end
  
  def kind
    if valid?  
      type = :equilateral if sides.all? {|s| s = sides[0]}
      type = :isosceles if sides.uniq.count == 2
      type = :scalene if  sides.uniq.count == 3
      type
    else
      raise TriangleError
    end
  end

end

class TriangleError < StandardError

end