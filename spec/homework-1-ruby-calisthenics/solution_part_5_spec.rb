require 'spec_helper'

describe Class do
  it 'should respond to method #attr_accessor_with_history' do
    Class.should respond_to 'attr_accessor_with_history'
  end

  describe '#attr_accessor_with_history' do
    before :each do
      class Foo; attr_accessor_with_history :bar; end
    end

    let(:foo) { Foo.new }

    it 'should create the getter' do
      foo.should respond_to 'bar'
    end

    it 'should create the setter' do
      foo.should respond_to 'bar='
    end

    it 'should accept more than one parameter' do
      class Foo; attr_accessor_with_history :abc, :def; end
      ['abc','def'].each do |attribute|
        Foo.new.should respond_to attribute
        Foo.new.should respond_to "#{attribute}="
      end
    end

    it 'should maintain the history separately for each object instance' do
      foo.bar = 1
      foo.bar = 2
      foo = Foo.new
      foo.bar = 4
      foo.bar_history.should == [nil,4]
    end

    context 'on initializing an object' do
      it 'should initialize the history array with nil' do
        foo.bar_history.should == [nil]
      end
    end

    context 'after initializing an object' do
      it 'should track every value the attribute has ever had' do
        foo.bar = 3
        foo.bar = :wowzo
        foo.bar = 'boo!'
        foo.bar_history.should == [nil, 3, :wowzo, 'boo!']
      end
    end
  end
end
