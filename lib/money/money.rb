# frozen_string_literal: true

# We need to implement the very first class as a starting point for our future logic.

# - `Money` objects should have an amount of money and currency as properties
# - The amount of money should have a 2-digit precision
# - Add the ability to convert a `Money` object to a `String`
# - Display the object nicely, so we don't display any object ID, 
# just in the following format `#<Money amount (currency)>`
require 'money/kernel'
require 'money/services/get_currency_conversion'

class Money 

  CURRENCIES = ["USD","GBP", "USD", "EUR", "CHF", "PLN"].freeze
  DEFAULT_CURRENCY = "USD".freeze
  class UnsupportedType < StandardError; end

  attr_reader :money, :currency

  def initialize(money:nil, currency: nil)
    @money = money.to_f.round(2)
    @currency = currency
  end

  def self.using_default_currency
    money = yield
    raise UnsupportedType unless money.is_a?(Integer) || money.is_a?(Float)
    Money(money, DEFAULT_CURRENCY)
  end

  def exchange_to(to_currency)
    GetCurrencyConversion.new(self, to_currency).call
  end

  def inspect
    "#<Money #{@money} #{@currency}>"
  end

  def display
    "#{@money.to_i} #{@currency}"
  end

  CURRENCIES.each do |curr|
	  define_singleton_method("from_#{curr}") do |argument|
			self.new(money: argument, currency: curr)
  	end
  end

  CURRENCIES.each do |curr|
	  define_method("to_#{curr}") do
			original_object = self
      currency_to_convert_to = curr
      converted_object = original_object.exchange_to(currency_to_convert_to)
      converted_object
  	end
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /^to_(.+)$/
      CURRENCIES.include?(curr)
      to($1 => args.upcase)  # to_curr, the $1 is `curr`
    else
      CURRENCIES.include?(curr)
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name_string = method_name.to_s
    curr = method_name_string.gsub("to_", "")
    CURRENCIES.include?(curr)
  end
end
