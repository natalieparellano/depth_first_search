require 'spec_helper'

describe Tree do
  let( :tree ){ Tree.new( Node.new( "a" )) }
  it "is initialized with a head" do 
    tree
  end
  describe "#head" do 
    it "is defined" do 
      tree.head
    end
  end  
end
