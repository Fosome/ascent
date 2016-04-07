module Ascent
  class StockQuote

    def initialize(venue, stock)
      @venue = venue
      @stock = stock
    end

    def bid
      fetch("bid")
    end

    def bid_size
      fetch("bidSize")
    end

    def bid_depth
      fetch("bidDepth")
    end

    def ask
      fetch("ask")
    end

    def ask_size
      fetch("askSize")
    end

    def ask_depth
      fetch("askDepth")
    end

    def spread
      ask - bid
    end

    def spread?
      ask > 0 && bid > 0
    end

    private

    attr_reader :venue, :stock

    def fetch(key, default = 0)
      response.parsed_body.fetch(key, default)
    end

    def response
      @response ||= request.response
    end

    def request
      @request ||= Ascent::Request.new(path)
    end

    def path
      "venues/#{venue}/stocks/#{stock}/quote"
    end
  end
end
