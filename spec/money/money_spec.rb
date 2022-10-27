# frozen_string_literal: true

require_relative '../../lib/money/money.rb'

RSpec.describe Money do
  subject { described_class.new(money: money, currency: currency)}
  let(:money) { 10 }
  let(:currency) { 'GBP' }
  let(:object_string) { '<#Money 10.0 GBP>'}

  it { is_expected.to have_attributes(money: money, currency: currency) }

  describe '#inspect' do
    it 'casts the object to string' do
      expect(subject.to_string).to eq(object_string)
    end
  end


end