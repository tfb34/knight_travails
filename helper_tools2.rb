require './linkedlist'
require './vertex'

# These functions CREATE THE BOARD AND THE RELATIONS b/w THE VERTICES

def append_down_nodes(list,row,col)
  updown(list,row,col){row-2}
end

def append_up_nodes(list,row,col)
  updown(list,row,col){row+2}
end

def updown(list,row,col)
new_pos= yield
 return if out_of_bounds?(new_pos)
  left=col-1
  right=col+1
      
  2.times do 
   if !out_of_bounds?(left)
     node=Node.new
     node.row_index=new_pos
     node.col_index=left
     node.value=[new_pos,left]#"[#{new_pos},#{left}]"
     list.append(node)
   end
   left = right 
  end
 end

def append_left_nodes(list,row,col)
  leftright(list,row,col){col-2}
end
  
def append_right_nodes(list,row,col)
  leftright(list,row,col){col+2}
end

def leftright(list,row,col)
 new_pos=yield
 return if out_of_bounds?(new_pos)
  down = row-1
  up = row +1

  2.times do 
    if !out_of_bounds?(down)
      node=Node.new
      node.row_index=down 
      node.col_index=new_pos
      node.value = [down,new_pos]# "[#{down},#{new_pos}]"
      list.append(node)
    end
      down = up
  end
end

def out_of_bounds?(value)
  return false if value > -1 && value < 8
  return true
end

def game_board
  return Array.new(8) {Array.new(8)}
end

#finds neighbors/valid positions in relation to current position
def build_nodelist(row,col)
  #represents the positions the horse can move to on a chess board
  list=LinkedList.new #at most list can contain 8 relations. 
  append_down_nodes(list,row,col)
  append_up_nodes(list,row,col)
  append_left_nodes(list,row,col)
  append_right_nodes(list,row,col)
  return list
end
#creates a vertex object for every cell in 2-d array. so a total of 8x8 = 64 vertices
#appends each vertex to the given queue
def initialize_board(board,queue)
  for row in 0...8
    for col in 0...8
      board[row][col]= Vertex.new([row,col])
      board[row][col].neighbors= build_nodelist(row,col)
          queue << board[row][col]
    end
  end
end
