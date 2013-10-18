# Maybe they are not needed
# just use [x, y] for a Point
# and [[x, y], [x, y]] for a segment

class Point

  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
end

class Segment
  
  attr_reader :a, :b
  
  def initialize(a, b)
    @a = a
    @b = b
  end
  
end