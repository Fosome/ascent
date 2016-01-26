# Entry point for exercise 3
require "typhoeus"
require "pry"

$:.push File.expand_path("../lib", __FILE__)
require "ascent"

testex = Ascent::Venue.new("testex")
# foobar = Ascent::Stock.new("foobar")

# maker = Ascent::MarketMaker.new
# maker.run

binding.pry
