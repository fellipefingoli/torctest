# frozen_string_literal: true

RSpec.describe Torctest::TaxProduct do
  let(:product) { double(:Product, name: 'music CD', quantity: 1, original_price: 14.99, imported: false) }

  subject { described_class.apply(product) }

  it 'return a OpenStruct with the new price and the tax of the product' do
    expect(subject.price).to be(16.49)
    expect(subject.tax_fee).to be(1.5)
  end

  context 'when the product is imported' do
    let(:product) { double(:Product, name: 'box of chocolates', quantity: 1, original_price: 10.00, imported: true) }

    it 'return a OpenStruct with the new price and the tax of the product' do
      expect(subject.price).to be(10.5)
      expect(subject.tax_fee).to be(0.5)
    end
  end

  context 'when the product is taxed and is imported' do
    let(:product) { double(:Product, name: 'bottle of perfume', quantity: 1, original_price: 47.50, imported: true) }

    it 'return a OpenStruct with the new price and the tax of the product' do
      expect(subject.price).to be(54.86)
      expect(subject.tax_fee).to be(7.36)
    end
  end
end
