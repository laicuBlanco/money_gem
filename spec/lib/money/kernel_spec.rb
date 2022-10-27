# frozen_string_literal: true

require './lib/money/kernel'

RSpec.describe Kernel do
  subject { Money(money, currency) }

  let(:money) { 20 }
  let(:currency) { "USD" }
  
  it 'returns an instance of Money' do
    expect(subject).to be_a_kind_of(Money) 
  end
end
