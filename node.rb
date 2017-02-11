#represents 'edges' of the vertices in the board
class Node
 attr_accessor :next_node, :value, :row_index, :col_index
 def initialize
  @value=nil
  @next_node=nil
 end
 
end