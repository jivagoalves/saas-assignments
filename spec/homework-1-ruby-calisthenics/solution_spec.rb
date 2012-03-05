require 'spec_helper'

describe "palindrome?" do
  let(:palindrome) { "ama" }
  
  context "when it is a palindrome" do
    it 'should return true' do
      palindrome?(palindrome).should be_true
    end
  end

  context "when it isn't a palindrome" do
    it 'should return false' do
      palindrome?("#{palindrome}a").should be_false
    end
  end

  it 'should ignore case' do
    palindrome?("A#{palindrome}a").should be_true
    palindrome?("#{palindrome}Aa#{palindrome}").should be_true
  end

  it 'should ignore punctuation' do
    ['?','!','.',',','-',';',':'].each do |c|
      palindrome?("#{palindrome}#{c}").should be_true
    end
  end
end

describe "count_words" do
  
end
