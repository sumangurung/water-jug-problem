require 'Node.rb'
class WaterJug
  attr_accessor :startNode, :goalNode, :openList, :closedList, :jugxlim, :jugylim
  
  def initialize(startNode, goalNode, jugxlim, jugylim)
    @startNode = startNode
    @goalNode = goalNode
    @jugxlim = jugxlim
    @jugylim = jugylim
  end

  def expand(node)
    successors = Array.new
     if(node.x<4)
      successors.push Node.new(4, node.y, node)
    end
    if(node.y<3)
      successors.push Node.new(node.x, 3, node)
    end
    if(node.x > 0)
      successors.push Node.new(0, node.y, node)
    end
    if(node.y > 0)
      successors.push Node.new(node.x, 0, node)
    end
    if(node.x + node.y >= jugxlim && node.y > 0)
      successors.push Node.new(jugxlim, node.y - (jugxlim - node.x), node)
    end
    if(node.x + node.y >= 3  && node.x > 0)
      successors.push Node.new((node.x - (jugylim - node.y)) , jugylim, node)
    end
    if(node.x + node.y  <= jugxlim && node.y > 0)
      successors.push Node.new(node.x + node.y , 0, node)
    end
    if(node.x + node.y <= jugylim && node.x > 0)
      successors.push Node.new(0, node.x + node.y, node)
    end
    successors      
  end  
  
  def searchInitialize()
    @openList = Array.new
    @closedList = Array.new
    
  end
  
   
  
  def findPathDFS()    
    searchInitialize
    @openList << @startNode
    found = false
    while !@openList.empty?  && found ==false
      node = @openList.pop
      @closedList << node
      if node == @goalNode
        found = true
        break
      else
        insertInOpenList(expand(node))
      end
    end
  if(found)
    printPath node
  else
    puts "No Path found"
  end
  
end

def findPathBFS()
  
  searchInitialize
  found = false
  @openList << @startNode
  while !@openList.empty? && found == false
    node = @openList.delete_at(0)
    @closedList << node
    if node == @goalNode
      found = true
      break
    else
      insertInOpenList(expand(node))
    end
    
  end 
  if(found)
    printPath node
  else
    puts "No Path found"
  end
end

def findAllPathDFS()
  paths = Array.new
  searchInitialize
    @openList << @startNode
    found = false
    while !@openList.empty? 
      node = @openList.pop
      @closedList << node
      if node == @goalNode
        paths << node
      else
        insertInOpenList(expand(node))
      end
    end
  if(!paths.empty?)
    count = 0
    paths.each {|e| puts "path #{count=count.next} \n #{printPath(e)}" }
  else
    puts "No Path found"
  end
  
end


  
  
  def printPath(node)
    stack = Array.new
    
    until node.nil?
      stack.push node
      node = node.parent
    end
    
    puts stack.reverse
  end
  

  def insertInOpenList(list)
    list.each {|e| @openList << e if !@closedList.include?e}
  end
  
  
end




  