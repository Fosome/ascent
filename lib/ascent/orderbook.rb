module Ascent
  class Orderbook

    def initialize(venue, stock)
      @venue = venue
      @stock = stock
    end

    def entries
      # TODO
      []
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
      "venues/#{venue.to_s}/stocks/#{stock.to_s}"
    end

    class Entry

      attr_reader :data

      def initialize(data)
        @data = data
      end

      def price
        data.fetch("price")
      end

      def quantity
        data.fetch("quantity")
      end

      def bid?
        buy?
      end

      def ask?
        !buy?
      end

      private

      def buy?
        data.fetch("isBuy")
      end
    end
  end
end
