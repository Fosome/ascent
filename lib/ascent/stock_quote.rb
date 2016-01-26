module Ascent
  class StockQuote

    def initialize(venue, stock)
      @venue = venue
      @stock = stock
    end

    def bid
      response.parsed_body.fetch("bid")
    end

    def bid_size
      response.parsed_body.fetch("bidSize")
    end

    def bid_depth
      response.parsed_body.fetch("bidDepth")
    end

    def ask
      response.parsed_body.fetch("ask")
    end

    def ask_size
      response.parsed_body.fetch("askSize")
    end

    def ask_depth
      response.parsed_body.fetch("askDepth")
    end

    def spread
      ask - bid
    end

    private

    attr_reader :venue, :stock

    def response
      @response ||= request.response
    end

    def request
      @request ||= Ascent::Request.new(path)
    end

    def path
      "venues/#{venue.to_s}/stocks/#{stock.to_s}/quote"
    end
  end
end
