require "json"

module Ascent
  class Request

    def initialize(path, opts = {})
      @path = path
      @opts = opts
    end

    def response
      @response ||= begin
        response = request.run

        # TODO debug/fail mode?
        #fail unless response.success?
        
        Ascent::Response.new(response)
      end
    end

    private

    attr_reader :path, :opts

    def request
      @request ||= Typhoeus::Request.new(
        uri,
        options
      )
    end

    def uri
      URI([base_url, path].join("/"))
    end

    def options
      opts.merge(:headers => headers)
    end

    def headers
      {
        "X-Starfighter-Authorization" => api_key
      }
    end

    def base_url
      "https://api.stockfighter.io/ob/api"
    end

    def api_key
      "6566dbdbd03a09a7d1747dd70b260eed25464e3d"
    end
  end
end
