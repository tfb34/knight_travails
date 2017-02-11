#require './linkedlist'
#require '.node'
require './helper_tools2'
#require './vertex.rb'


# Input: two arrays
# output: path
def knight_moves(src, target)
	
	queue=[]
	#create 2-d array
	board = game_board
	
	#every cell in board shall contain a vertex object and that object 'enqueued' to queue
	initialize_board(board,queue)
     
    row= src[0]
	col=src[1]
	#set up src vertex 
	board[row][col].distance=0
    
	while !queue.empty?
	  #find neighbor w/ minimum distance and dequeue it 
	  u=queue.min_by(&:distance)
      queue.delete(u)

      #check for target
      if u.value == target
        print_path(u)
        return;nil
      end
      #find neighbors(traverse linked list) and update them
       n=u.neighbors.head
       
       while(n!=nil)
       	 #find index of vertex in queue 
          pos=queue.find_index{|v| v.value==n.value}
          
          if pos!=nil
             tmp = u.distance + 1
             vertex=queue[pos]
             
             if tmp < vertex.distance  
             	vertex.distance = tmp
             	vertex.prev=u
             end
           end
           n=n.next_node
       end
    end
    puts "target was not found"
    return 

end


def print_path(vertex,n=-1)
   if vertex.nil?
   	puts "You made it in #{n} moves! Here's your path:"
   	return
   end
   n+=1
   print_path(vertex.prev,n)
   puts vertex.value.inspect
end


