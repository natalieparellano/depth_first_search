require 'spec_helper'

describe Searcher do
  before :all do 
    a = Node.new( "a" )
    b = Node.new( "b" )
    c = Node.new( "c" )
    d = Node.new( "d" )
    e = Node.new( "e" )
    f = Node.new( "f" )
    g = Node.new( "g" )
    h = Node.new( "h" )
    g.children << h
    c.children << g
    a.children = [b, c]
    b.children = [d, e, f]
    @tree = Tree.new( a )
  end

  let( :searcher ){ Searcher.new( @tree ) }

  it "is initialized with a head" do 
    searcher
  end
  describe "#tree" do 
    it "returns the tree" do 
      expect( searcher.tree ).to eq( @tree )
    end
  end
  describe "#visited" do 
    it "is defined" do 
      expect( searcher.visited ).to be_a( Array )
    end
  end
  describe "#search" do 
    it "takes an input value" do 
      searcher.search( "a" )
    end
    it "returns a node value" do 
      expect( searcher.search( "a" )).to eq( "a" )
    end
    context "searching for a" do 
      it "finds it in the right order" do 
        searcher.search( "a" )
        expect( searcher.visited ).to eq( ["a"] )
      end
    end
    context "searching for b" do 
      it "finds it in the right order" do 
        searcher.search( "b" )
        expect( searcher.visited ).to eq( ["a", "b"] )
      end
    end
    context "searching for c" do 
      it "finds it in the right order" do 
        searcher.search( "c" )
        expect( searcher.visited ).to eq( ["a", "b", "d", "e", "f", "c"] )
      end
    end
    context "searching for d" do 
      it "finds it in the right order" do 
        searcher.search( "d" )
        expect( searcher.visited ).to eq( ["a", "b", "d"] )
      end
    end
    context "searching for e" do 
      it "finds it in the right order" do 
        searcher.search( "e" )
        expect( searcher.visited ).to eq( ["a", "b", "d", "e"] )
      end
    end
    context "searching for f" do 
      it "finds it in the right order" do 
        searcher.search( "f" )
        expect( searcher.visited ).to eq( ["a", "b", "d", "e", "f"] )
      end
    end
    context "searching for g" do 
      it "finds it in the right order" do 
        searcher.search( "g" )
        expect( searcher.visited ).to eq( ["a", "b", "d", "e", "f", "c", "g"] )
      end
    end
    context "searching for h" do 
      it "finds it in the right order" do 
        searcher.search( "h" )
        expect( searcher.visited ).to eq( ["a", "b", "d", "e", "f", "c", "g", "h"] )
      end
    end
  end
end 
