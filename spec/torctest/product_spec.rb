# frozen_string_literal: true

require 'ostruct'

RSpec.describe Torctest::Product do
  let(:tax_product) { double(:tax_product) }
  subject { described_class.new({ name: 'music CD', quantity: 1, price: 14.99, imported: false }, tax_product) }

  before do
    allow(tax_product).to receive(:apply).and_return(OpenStruct.new(price: 16.49, tax_fee: 1.5))
  end

  it '.price' do
    expect(subject.price).to be(16.49)
  end

  it '.tax_fee' do
    expect(subject.tax_fee).to be(1.5)
  end
end
