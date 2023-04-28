require 'hashie/mash'

module FaradayMiddleware
  class BingbongHash < Faraday::Middleware
    def on_complete(env)
      env[:body] = parse(env[:body])
    end

    private

    def parse(body)
      case body
      when Hash
        ::Hashie::Mash.new(body)
      when Array
        body.map { |item| parse(item) }
      else
        body
      end
    end
  end
end
