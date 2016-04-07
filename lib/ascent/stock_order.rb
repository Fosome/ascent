module Ascent
  class StockOrder

    def self.create(account:, venue:, stock:, price:, direction:, quantity: 1, type: "limit")
      path     = "venues/#{venue}/stocks/#{stock}/orders"
      request = Ascent::Request.new(
        path,
        method: :post,
        body: {
          account:   account.to_s,
          venue:     venue.to_s,
          stock:     stock.to_s,
          price:     price,
          qty:       quantity,
          direction: direction,
          orderType: type
        }.to_json
      )

      response = request.response

      binding.pry

      if response.success?
        new(response.parsed_body)
      else
        fail "Bad Stock order"
      end
    end

    def initialize(data)
      @data = data
    end

    def id
      data.fetch("id")
    end

    private

    attr_reader :data
  end
end
