require 'spec_helper'

describe "combine_anagrams" do
  context "when there are no anagrams" do
    it "should return a group for each string" do
      words = ['cars','for','potatoes']
      words.each do |w|
        combine_anagrams(words).should include([w])
      end
      combine_anagrams(words).size.should be_equal(words.size)
    end
  end

  context "when there are two anagrams" do
    it "should group the anagrams" do
      words = ["cars","scar"]
      combine_anagrams(words).size.should be_equal(1)
      combine_anagrams(words).should include(["cars","scar"])
    end

    it "should not care about case" do
      words = ["cars","scAr"]
      combine_anagrams(words).size.should be_equal(1)
      combine_anagrams(words).should include(["cars","scAr"])
    end
  end

  context "when there are two anagrams and one string" do
    it "should group the two anagrams separated from the string" do
      words = ["cars","scar","mayo"]
      combine_anagrams(words).size.should be_equal(2)
      combine_anagrams(words).should include(["cars","scar"])
      combine_anagrams(words).should include(["mayo"])
    end
  end
end
