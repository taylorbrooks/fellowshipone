module Fellowshipone
  class Error < StandardError; end
  class BadRequest < Error; end
  class Forbidden < Error; end
  class GatewayTimeout < Error; end
  class InternalServerError < Error; end
  class NotFound < Error; end
  class ServiceUnavailable < Error; end
  class Unauthorized < Error; end
end

require 'faraday'
module FaradayMiddleware
  class FellowshiponeErrorHandler < Faraday::Response::Middleware
    ERROR_STATUSES = 400..600

    def on_complete(env)
      case env[:status]
      when 400
        raise Fellowshipone::BadRequest, error_message(env)
      when 401
        raise Fellowshipone::Unauthorized, error_message(env)
      when 403
        raise Fellowshipone::Forbidden, error_message(env)
      when 404
        raise Fellowshipone::NotFound, error_message(env)
      when 500
        raise Fellowshipone::InternalServerError, error_message(env)
      when 503
        raise Fellowshipone::ServiceUnavailable, error_message(env)
      when 504
        raise Fellowshipone::GatewayTimeout, error_message(env)
      when ERROR_STATUSES
        raise Fellowshipone::Error, error_message(env)
      end
    end

    private

    def error_message(env)
      "#{env[:status]}: #{env[:url]} #{env[:body]} #{env[:reason_phrase]}"
    end
  end
end
