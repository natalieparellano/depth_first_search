require 'spec_helper'

describe Node do
  let( :node ){ Node.new( "a" ) }
  it "is initialized with a value" do 
    node
  end
  describe "#value" do 
    it "is defined" do 
      node.value
    end
  end
  describe "#next" do 
    it "is defined" do 
      node.next
    end
  end
end
