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
  context "Given a string of input" do
    let(:words) { ["abc", "def"] }

    it 'should return a hash whose keys are words in the string' do
      hash = count_words(words.join(" "))
      words.each do |w|
        hash.keys.should include(w)
      end
      hash.keys.size.should be_equal(words.size)
    end

    it 'should count the words' do
      words << "abc"
      hash = count_words(words.join(" "))
      hash["abc"].should be_equal(2)
      hash["def"].should be_equal(1)
    end

    it 'should ignore case' do
      words << "Abc"
      hash = count_words(words.join(" "))
      hash["abc"].should be_equal(2)
      hash["def"].should be_equal(1)
    end

    it 'should igone nonwords' do
      words << ", ! - ?"
      hash = count_words(words.join(" "))
      hash["abc"].should be_equal(1)
      hash["def"].should be_equal(1)
      hash.size.should be_equal(2)
    end
  end
end
