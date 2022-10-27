# frozen_string_literal: true

require_relative "money_gem/version"
require "money/kernel"
require "money/money"
require "money/services/application_service"
require "money/services/get_currency_conversion"

module MoneyGem
  class Error < StandardError; end
  # Your code goes here...
end
