class Node
  attr_accessor :x, :y, :parent
  
  def initialize(x, y, parent = nil)
    @x = x
    @y = y
    @parent = parent
  end
  
  def to_s()
    "x : #{@x} , y : #{@y}"
  end
  
  def == obj
    @x == obj.x && @y == obj.y  
  end
end

