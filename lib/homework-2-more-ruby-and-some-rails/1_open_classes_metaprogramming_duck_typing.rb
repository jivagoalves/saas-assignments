# metaprogramming to the rescue!

class Numeric
  @@currencies = {
    :dollar => 1,
    :euro => 1.292,
    :yen => 0.013,
    :rupee => 0.019
  }

  @@currencies.each_pair do |currency, value|
    define_method(currency.to_s) do
      calculate_currency_for currency
    end
    define_method(currency.to_s + "s") do
      calculate_currency_for currency
    end
  end

  define_method("in") do |currency|
    singular_currency = currency.to_s.gsub(/s$/,"").to_sym
    result = self / @@currencies[singular_currency]
    result.currency = singular_currency
    result
  end

  attr_writer :currency

  def currency
    @currency ||= :dollar
  end

  private

  def calculate_currency_for(currency)
    result = self * @@currencies[currency]
    result.currency = currency
    result
  end
end

class String
  def palindrome?
    str = self.downcase.gsub(/\W+/,"")
    str == str.reverse
  end
end

module Enumerable
  def palindrome?
    return false unless self.respond_to?(:each)
    normal, reverse = [],[]
    self.each do |elt|
      normal << elt
      reverse.insert 0, elt
    end
    normal == reverse
  end
end
