def combine_anagrams(words)
  result = []
  groups = {}
  words.each do |w|
    key = w.chars.sort.join
    groups[key] ||= []
    groups[key] << w unless groups[key].include?(w)
  end
  groups.each do |k,v|
    result << groups[k]
  end
  result
end
