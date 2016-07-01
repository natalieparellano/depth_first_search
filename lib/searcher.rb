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
    # @pointer = tree.head
    do_search0( value, tree.head )
    # if pointer.value == value
    #   return pointer
    # else
    #   return nil
    # end
  end
  private
    def do_search0( value, pointer )
      visited << pointer.value
      if ( pointer.value == value )
        return pointer
      else
        pointer.children.each do |node|
          return if visited.include?( value ) || # we found it through a sibling that was evaluated first
              visited.include?( node.value ) # the tree has a cycle 
          do_search0( value, node ) 
        end
        return nil # otherwise the return value when nothing is found will be pointer.children        
      end           
    end

    def do_search( value )
      # actually, this does NOT work because the pointer has been moved already! 
      #   "visited" will be correct (and pass the tests), but if we have expectations around 
      #   pointer.value these will fail
      # return if visited.include?( value ) || 
      #     visited.include?( pointer.value )
      visited << pointer.value
      puts "visited: #{visited}"
      puts "pointing at: #{pointer.value}"
      if pointer.value == value
        return
      else        
        pointer.children.each do |node|
          return if visited.include?( value ) || # we found it through a sibling that was evaluated first
              visited.include?( node.value ) # the tree has a cycle 
          @pointer = node
          do_search( value )
        end
      end
    end
end