# frozen_string_literal: true

module Torctest
  class InputPrompt
    PRODUCT_REGEXP = /^(\d) (imported )?(.+) at (\d+.\d{2})$/.freeze

    def self.call
      products = []
      stop_command = 'n'
      command = 'Y'
      while command.strip  != stop_command
        puts '### Please insert each product:'
        product = $stdin.gets
        _, quantity, imported, name, price = PRODUCT_REGEXP.match(product).to_a
        products.push({ name: name, quantity: quantity.to_i, price: price.to_f,
                        imported: imported.nil? ? false : true })
        puts '### Want to add more one product? [Y/n]'
        command = $stdin.gets
      end

      products
    end
  end
end
