# frozen_string_literal: true

require './lib/money/money'

RSpec.describe Money do
  subject { described_class.new(money: money, currency: currency) }
  let(:money) { 10 }
  let(:currency) { 'GBP' }
  let(:object_string) { '#<Money 10.0 GBP>' }
  let(:money_unit_n_currency) { '10 GBP' }

  it { is_expected.to have_attributes(money: money, currency: currency) }

  describe '#inspect' do
    it 'displays the object as string' do
      expect(subject.inspect).to eq(object_string)
    end
  end

  describe '#display' do
    it 'displays the money unit and currency' do
      expect(subject.display).to eq(money_unit_n_currency)
    end
  end

  describe '#exchange_to' do
    it 'converts from one currency to an other' do
      expect(subject.exchange_to("USD")).to be_a_kind_of(Hash)
    end
  end
end