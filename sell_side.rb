# Entry point for exercise 3
require "typhoeus"
require "pry"

$:.push File.expand_path("../lib", __FILE__)
require "ascent"

account = "FLB38099843"

# maker = Ascent::MarketMaker.new
# maker.run

#testex = Ascent::Venue.new("testex")
#foobar = Ascent::Stock.new("foobar")
venue = Ascent::Venue.new("WSBEX")
stock = Ascent::Stock.new("LCI")

order = Ascent::StockOrder.create(
  account: account,
  venue: venue,
  stock: stock,
  price: 1000,
  quantity: 10,
  direction: "buy",
  type: "limit"
)

#maker = Ascent::MarketMaker.new(venue, stock)
#maker.run
