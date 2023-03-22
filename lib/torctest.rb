# frozen_string_literal: true

require_relative 'torctest/version'
require_relative 'torctest/input_prompt'
require_relative 'torctest/output_prompt'
require_relative 'torctest/product'
require_relative 'torctest/tax_product'

module Torctest
  class Error < StandardError; end

  class App
    def run
      products = InputPrompt.call.map do |product|
        Product.new(product, TaxProduct)
      end

      OutputPrompt.call(products)
    end
  end
end
