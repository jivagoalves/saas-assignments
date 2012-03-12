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

  describe "#currency" do
    it "should respond to currency" do
      numeric.should respond_to :currency
    end

    it "should have the default currency equal to dollar" do
      numeric.currency.should == :dollar
    end

    CURRENCIES.each_pair do |key, value|
      context "for #{key.to_s}" do
        it "should change the currency" do
          1.currency.should == :dollar
          1.send(key).currency.should == key
        end

        it "should keep the currency" do
          1.send(key).currency.should == key
          value.currency.should == :dollar
        end
      end
    end
  end

  describe "#in" do
    it "should respond to #in" do
      numeric.should respond_to :in
    end

    CURRENCIES.each_key do |key|
      context "for #{key.to_s}" do
        let(:key_with_s) { (key.to_s + "s").to_sym }

        CURRENCIES.each_pair do |currency, value|
          it "should convert to #{currency.to_s}" do
            currency_with_s = (currency.to_s + "s").to_sym

            1.send(key).in(currency).should == 1 * CURRENCIES[key] / CURRENCIES[currency]
            2.send(key_with_s).in(currency_with_s).should == 2 * CURRENCIES[key] / CURRENCIES[currency]
          end
        end
      end
    end
  end
end

describe String do
  describe "#palindrome?" do
    let(:palindrome) { "ama" }

    context "when it is a palindrome" do
      it 'should return true' do
        "ama".should be_palindrome
      end
    end

    context "when it isn't a palindrome" do
      it 'should return false' do
        "amaa".should_not be_palindrome
      end
    end

    it 'should ignore case' do
      "Aamaa".should be_palindrome
      "amaAaama".should be_palindrome
    end

    it 'should ignore punctuation' do
      ['?','!','.',',','-',';',':'].each do |c|
        ("ama" + c).should be_palindrome
      end
    end
  end
end
