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

  private

  def calculate_currency_for(currency)
    self * @@currencies[currency]
  end
end
