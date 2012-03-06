def combine_anagrams(words)
  groups = Hash.new {|hash,key| hash[key] = []}
  words.each do |w|
    groups[w.downcase.chars.sort.join] << w
  end
  groups.values
end
