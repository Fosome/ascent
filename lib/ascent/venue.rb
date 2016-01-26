module Ascent
  class Venue

    attr_reader :code

    def initialize(code)
      @code = code.to_s.upcase
    end

    def to_s
      code
    end

    def available?
      response.success?
    end

    private

    def response
      @response ||= request.response
    end

    def request
      @request ||= Ascent::Request.new(path)
    end

    def path
      "venues/#{code}/heartbeat"
    end
  end
end
