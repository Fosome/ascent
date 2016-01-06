require "json"
require "typhoeus"
require "pry"

API_KEY = "6566dbdbd03a09a7d1747dd70b260eed25464e3d"
HOST    = "https://api.stockfighter.io/ob/api"

ACCOUNT = "IBB2810290"
VENUE   = "ZUMEX"
STOCK   = "YHG"
PATH    = "venues/#{VENUE}/stocks/#{STOCK}/orders"

MAX      = 100000
QUANTITY = 2300
PRICE    = 7850

@total   = 0
@retries = 0

def next_purchase_amount
  return QUANTITY if (@total + QUANTITY) <= MAX
  MAX - @total
end

def uri
  URI([HOST, PATH].join("/"))
end

def body
  JSON.dump({
    "account"   => ACCOUNT,
    "venue"     => VENUE,
    "symbol"    => STOCK,
    "price"     => PRICE,
    "qty"       => next_purchase_amount,
    "direction" => "buy",
    "orderType" => "immediate-or-cancel"
  })
end

while (@total < MAX) do
  puts "Trading..."

  request = Typhoeus::Request.new(
    uri,
    method:   :post,
    body:     body,
    headers:  {
      "X-Starfighter-Authorization" => API_KEY
    }
  )

  response = request.run

  if response.success?
    @total += next_purchase_amount
    sleep(1)
  else
    if @retries >= 3
      fail "Max retries...exiting"
      break
    else
      @retries += 1
      puts "A trade failed...retrying"
    end
  end
end

puts "Trading complete. Bought #{@total} shares of #{STOCK} (#{VENUE})"
