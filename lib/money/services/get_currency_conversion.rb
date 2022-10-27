# frozen_string_literal: true

require "uri"
require "net/http"
require "./lib/money/services/application_service"
require './lib/money/kernel.rb'
require 'pry'

class GetCurrencyConversion < ApplicationService
  
  def initialize(money_object, to_currency)
    @money_object = money_object
    @to_currency = to_currency
  end

  def call
    convert
  end

  private 

  attr_reader :money_object, :to_currency

  def convert
    url = URI("https://api.apilayer.com/currency_data/convert?to=#{to_currency}&from=#{from_currency}&amount=#{amount}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = "p39Q7vbkUdhYTMVTfEv3WBu4DMVuaDJF"

    response = https.request(request)
    puts response.read_body
  end

  def from_currency
    money_object.currency
  end
  
  def amount
    money_object.money
  end

end