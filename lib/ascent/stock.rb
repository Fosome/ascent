module Ascent
  class Stock

    attr_reader :code

    def initialize(code)
      @code = code.to_s.upcase
    end

    def to_s
      code
    end
  end
end
