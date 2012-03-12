require 'spec_helper'

describe CartesianProduct do
  let(:cartesian_product) { CartesianProduct.new([:a,:b],[4,5]) }

  describe "#new" do
    it "should accept two sequences" do
      CartesianProduct.new([:a,:b],[4,5])
    end
  end

  describe "#elements" do

    it "should return the elements in the cartesian product" do
      cartesian_product.elements.sort.should == [[:a,4],[:a,5],[:b,4],[:b,5]].sort
      cartesian_product.elements.each do |elt|
        [:a,:b].should include(elt.first)
        [4,5].should include(elt.last)
      end
    end

    it "should not duplicate elements" do
      CartesianProduct.new([:a,:b,:b],[4]).elements.sort.should == [[:a,4],[:b,4]]
      CartesianProduct.new([:a],[4,5]).elements.sort.should == [[:a,4],[:a,5]]
    end

    context "when one of the sequences is empty" do
      it "should not return any elements" do
        CartesianProduct.new([:a,:b],[]).elements.should == []
        CartesianProduct.new([],[4,5]).elements.should == []
      end
    end
  end

  describe "#each" do
    it "should iterate through the elements" do
      result = []
      cartesian_product.each do |elt|
        result << elt
      end
      result.sort.should == [[:a,4],[:a,5],[:b,4],[:b,5]].sort
    end
  end
end
