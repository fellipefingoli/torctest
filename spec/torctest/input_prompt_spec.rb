# frozen_string_literal: true

RSpec.describe Torctest::InputPrompt do
  subject { described_class.call }

  it 'get a list of products from prompt' do
    allow($stdin).to receive(:gets).and_return('2 book at 12.49', '\n', '1 music CD at 14.99', 'n')

    expect(subject).to eq([
                            { name: 'book', quantity: 2, price: 12.49, imported: false },
                            { name: 'music CD', quantity: 1, price: 14.99, imported: false }
                          ])
  end

  it 'get a list of imported products from pompt' do
    allow($stdin).to receive(:gets).and_return('1 imported box of chocolates at 10.00', 'y',
                                               '1 imported bottle of perfume at 47.50', 'n')

    expect(subject).to eq([
                            { name: 'box of chocolates', quantity: 1, price: 10.00, imported: true },
                            { name: 'bottle of perfume', quantity: 1, price: 47.50, imported: true }
                          ])
  end
end
