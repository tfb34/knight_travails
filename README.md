# knight_travails

A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns. Its basic move is two steps forward and one step to the side. It can face any direction.

<h4>Note:</h4>
search algorithm: Dijkstra's shortest path algorithm

<h4>Objective:</h4>
To find the shortest path between two coordinates on a chess board. Here, we have a function, knight_moves, that takes in two arrays and outputs a path. The arrays given represent the src and target coordinates in the 8x8 grid. 

<h4>Run program:</h4>
Open terminal and change the directory to the one that stores the 'knight_travails.rb' file. To load the file into the interactive ruby console, type the following command:
<p> >  irb -r ./knight_travails.rb</p>
Now you can use the function!
<p>>  knight_moves([3,3],[4,3])</p>
<p>You made it in 3 moves! Here's your path:<p>
[3,3]<br>
[1,4]<br>
[2,2]<br>
[4,3]


