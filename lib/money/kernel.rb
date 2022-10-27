# frozen_string_literal: true

require 'money/money'

module Kernel
  def Money(money, currency)
    Money.new(money: money, currency: currency)
  end
end
