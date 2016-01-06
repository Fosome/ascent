require "typhoeus"

require "pry"

API_KEY = "6566dbdbd03a09a7d1747dd70b260eed25464e3d"

HOST  = "https://api.stockfighter.io/ob/api"
VENUE = "IKYJUNK"
PATH  = "venues/#{VENUE}/heartbeat"

def uri
  URI([HOST, PATH].join("/"))
end

request  = Typhoeus::Request.new(uri)
response = request.run

puts response.return_code
