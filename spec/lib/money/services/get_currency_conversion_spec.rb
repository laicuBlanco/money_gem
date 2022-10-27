# frozen_string_literal: true

require './lib/money/services/get_currency_conversion'

RSpec.describe GetCurrencyConversion do
  subject { described_class }

  describe 'GET path'
    it "returns http success" do
      get "new"

      expect(response).to have_http_status(:success)
    end
  end
end


GetCurrencyConversion.new
{
    "success": true,
    "query": {
        "from": "GBP",
        "to": "USD",
        "amount": 100
    },
    "info": {
        "timestamp": 1666879384,
        "quote": 1.159561
    },
    "result": 115.9561
}