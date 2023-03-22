module Torctest
  class Product
    attr_reader :name, :quantity, :original_price, :imported, :tax_product

    def initialize(params, tax_product)
      @name = params[:name]
      @quantity = params[:quantity]
      @original_price = params[:price]
      @imported = params[:imported]
      @tax_product = tax_product
    end

    def price
      @price ||= tax_product.apply(self).price
    end

    def tax_fee
      @tax_fee ||= tax_product.apply(self).tax_fee
    end
  end
end
