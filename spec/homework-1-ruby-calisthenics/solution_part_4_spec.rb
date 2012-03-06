require 'spec_helper'

describe Dessert do
  let(:dessert) { Dessert.new "pie", 200 }

  ["name","calories"].each do |attribute|
    it "should respond to ##{attribute}" do
      dessert.should respond_to attribute
    end

    it "should respond to ##{attribute}=" do
      dessert.should respond_to "#{attribute}="
    end
  end

  context "#new" do
    it "should initialize name" do
      dessert.name.should == "pie"
    end

    it "should initialize calories" do
      dessert.calories.should == 200
    end
  end

  context "#delicious?" do
    it "should return true" do
      dessert.delicious?.should be_true
    end
  end

  context "#healthy?" do
    context "when a dessert has less than 200 calories" do
      it "should return true" do
        Dessert.new("pie", 10).healthy?.should be_true
      end
    end

    context "otherwise" do
      it "should return false" do
        Dessert.new("pie", 200).healthy?.should be_false
        Dessert.new("pie", 201).healthy?.should be_false
      end
    end
  end
end

describe JellyBean do
  let(:jolly_bean) { JellyBean.new "pie", 100, "black licorice" }

  it "should extends Dessert" do
    JellyBean.superclass.should == Dessert
  end

  ["flavor"].each do |attribute|
    it "should respond to ##{attribute}" do
      jolly_bean.should respond_to attribute
    end

    it "should respond to ##{attribute}=" do
      jolly_bean.should respond_to "#{attribute}="
    end
  end

  context "#delicious?" do
    context "when the flavor is equal to 'black licorice'" do
      it "should return false" do
        jolly_bean.delicious?.should be_false
      end
    end

    context "otherwise" do
      it "should return true" do
        jolly_bean.flavor = "other"
        jolly_bean.delicious?.should be_true
      end
    end
  end
end
