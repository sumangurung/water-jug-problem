require 'WaterJug.rb'
require 'Node.rb'

startNode = Node.new(0,0)
goalNode = Node.new(2, 0)

wj = WaterJug.new(startNode, goalNode,4,3)

puts "path with dfs"
wj.findPathDFS



puts "path with bfs"
wj.findPathBFS


#wj.findAllPathDFS


