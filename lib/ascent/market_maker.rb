module Ascent
  class MarketMaker

    def initialize(venue, stock)
      @venue = venue
      @stock = stock

      @orders = []
    end

    def run
      last_spread = 0
      action = :wait

      bid_price = 0
      ask_price = 0

      10.times do
        # get quote
        quote = new_quote
        last_spread = quote.spread if quote.spread?
        puts "QUOTE: Bid: #{quote.bid} (#{quote.bid_size}), Ask: #{quote.ask} (#{quote.ask_size}), Spread: #{quote.spread} (#{last_spread})"

        # make decision
        if quote.bid_size == 0 && quote.ask_size == 0
          puts "Just watching..."
          action = :wait
        elsif quote.bid_size == 0
          bid_price = quote.ask + last_spread
          puts "Time to BUY : @#{bid_price}"
          action = :bid
        elsif quote.ask_size == 0
          ask_price = quote.bid - last_spread
          puts "Time to SELL: @#{ask_price}"
          action = :ask
        else
          puts "Just watching..."
          action = :wait
        end

        # update orders

        # make orders
        case action
        when :bid
          puts "Buying some stock"
          bid_at(bid_price)
        when :ask
          puts "Selling some stock"
          ask_at(ask_price)
        when :wait
          puts "Do nothing"
        end

        # slow ur roll
        puts "---\n"
        sleep(1)
      end

      puts orders
      puts "Finished"
    end

    private

    attr_reader :venue, :stock, :orders

    def bid_at(price)
      #order = Ascent::StockOrder.create(price: price, direction: :bid, type: :fill_or_kill)
      #add_order << orders
    end

    def ask_at(price)
      #noop
    end

    def add_order(order)
      @orders << order
    end

    def exposure
      0 # TODO
    end

    def new_quote
      Ascent::StockQuote.new(venue, stock)
    end
  end
end
