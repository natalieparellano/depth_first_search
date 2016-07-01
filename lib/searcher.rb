require 'tree'

class Searcher
  attr_reader :tree, :visited, :pointer
  def initialize( tree )
    @tree = tree
    @visited = []
  end
  def search( value )
    @visited = [] # to make it idempotent
    @pointer = tree.head
    do_search( value )
    return pointer.value
  end
  private
    def do_search( value )      
      visited << pointer.value
    end
end