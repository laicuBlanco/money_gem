# frozen_string_literal: true

# We need to implement the very first class as a starting point for our future logic.

# - `Money` objects should have an amount of money and currency as properties
# - The amount of money should have a 2-digit precision
# - Add the ability to convert a `Money` object to a `String`
# - Display the object nicely, so we don't display any object ID, 
# just in the following format `#<Money amount (currency)>`

class Money 

  attr_reader :money, :currency

  def initialize(money:nil, currency: nil)
    @money = money.to_f.round(2)
    @currency = currency
  end

  def inspect
    "#<Money #{@money} #{@currency}>"
  end

  def display
    "#{@money.to_i} #{@currency}"
  end

  ["GBP", "USD", "EUR"].each do |curr|
	  define_singleton_method("from_#{curr}") do |argument|
			self.new(money: argument, currency: curr)
  	end
  end

end


money = Money.new(money:10)