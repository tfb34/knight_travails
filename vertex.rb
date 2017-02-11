require './linkedlist'
class Vertex 
attr_accessor :neighbors, :distance, :prev
attr_reader :value
	def initialize(value)
	  @value = value
      @neighbors=nil #linkedlist
      @distance= Float::INFINITY
      @prev=nil
	end
end