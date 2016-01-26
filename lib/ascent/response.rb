module Ascent
  class Response

    def initialize(response)
      @response = response
    end

    def success?
      response.success?
    end

    def parsed_body
      JSON.parse(response.body)
    end

    private

    attr_reader :response
  end
end
