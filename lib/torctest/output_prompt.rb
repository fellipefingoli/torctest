# frozen_string_literal: true

module Torctest
  class OutputPrompt
    def self.call(products)
      products.each do |product|
        puts "#{product.quantity} #{product.imported ? 'imported' : ''} #{product.name}: #{(product.price * product.quantity).round(2)}"
      end
      sales_taxes = products.inject(0) { |sum, product| sum + product.tax_fee }
      puts "Sales Taxes: #{sales_taxes.round(2)}"
      total = products.inject(0) { |sum, product| sum + (product.price * product.quantity) }
      puts "Total: #{total.round(2)}"
    end
  end
end
