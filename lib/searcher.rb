require 'tree'
require 'pry'

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
      puts "visited: #{visited}"
      puts "pointing at: #{pointer.value}"
      if pointer.value == value
        return
      else
        pointer.children.each do |node|
          return if visited.include?( value )
          @pointer = node
          do_search( value )
        end
      end
    end
end