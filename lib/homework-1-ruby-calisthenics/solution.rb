def palindrome?(string)
  str = string.downcase.gsub(/\W+/,"")
  str == str.reverse
end

def count_words(string)
end
