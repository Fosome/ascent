require "rspec"
require "pry"

require "ascent"

RSpec.configure do |c|
  c.color = true
  c.tty   = true

  c.disable_monkey_patching!
end
