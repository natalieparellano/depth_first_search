class Node
  attr_accessor :value, :children
  def initialize( value )
    @value = value
    @children = []
  end
end
