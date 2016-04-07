module Ascent
  class StockProfile

    def initialize(venue, stock, opts = {})
      @venue = venue
      @stock = stock
      @opts  = opts
    end

    def mean_bid
      sum = sample_size.times.inject(0) do |sum, i|
        sum += Ascent::StockQuote.new(venue, stock).bid
      end
      sum/sample_size
    end

    def mean_ask
    end

    def mean_spread
    end

    private

    attr_reader :venue, :stock, :opts

    def sample_size
      opts.fetch(:sample, 10)
    end
  end
end
