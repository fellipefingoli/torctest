# frozen_string_literal: true

require 'ostruct'

module Torctest
  class TaxProduct
    DEFAULT_TAX = 0.1
    IMPORTED_TAX = 0.05
    NO_FEE_PRODUCTS = %w[book books chocolate chocolates pills pill cake pie rice beans juice].freeze

    def self.apply(product)
      OpenStruct.new(
        price: taxed_product_price(product).round(2),
        tax_fee: taxed_product_fee(product).round(2)
      )
    end

    def self.calculate_tax_fee(product)
      no_fee_product = product.name.split(' ').any? { |name| NO_FEE_PRODUCTS.include? name }
      no_fee_product ? 0 : DEFAULT_TAX
    end

    def self.imported_tax(product)
      product.imported ? IMPORTED_TAX : 0
    end

    def self.taxed_product_fee(product)
      default_tax = calculate_tax_fee(product)
      imported_tax = imported_tax(product)
      imported_tax_fee = imported_tax.positive? ? product.original_price * imported_tax : 0.0
      tax_fee = default_tax.positive? ? (product.original_price + imported_tax_fee) * default_tax : 0.0
      tax_fee + imported_tax_fee
    end

    def self.taxed_product_price(product)
      product.original_price + taxed_product_fee(product)
    end
  end
end
