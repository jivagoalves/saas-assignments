require 'spec_helper'

CURRENCIES = {
  :dollar => 1,
  :euro => 1.292,
  :yen => 0.013,
  :rupee => 0.019
}

describe Numeric do

  let(:numeric) { Numeric.new }

  CURRENCIES.each_pair do |currency, value|
    context "for #{currency.to_s}" do
      it "should respond to ##{currency.to_s}" do
        numeric.should respond_to currency
      end

      it "should respond to ##{currency}s" do
        numeric.should respond_to "#{currency.to_s}s".to_sym
      end

      it "should convert the currency to #{currency}" do
        1.send(currency).should == 1 * value
        2.send(currency.to_s + "s").should == 2 * value
      end
    end
  end
end
