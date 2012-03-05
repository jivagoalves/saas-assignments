def palindrome?(string)
  str = string.downcase.gsub(/\W+/,"")
  str == str.reverse
end

def count_words(string)
  result = Hash.new 0
  string.gsub(/\w+/) {|w| result[w.downcase] = result[w.downcase] + 1}
  result
end
