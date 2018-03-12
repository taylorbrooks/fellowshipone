require 'oauth'

module Fellowshipone
  class Connection
    def self.connect(church_code:, consumer_key:, consumer_secret:, callback_url:)
      consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        site: "https://#{church_code}.fellowshiponeapi.com",
        request_token_path: '/v1/Tokens/RequestToken',
        authorize_path:     '/v1/PortalUser/Login',
        access_token_path:  '/v1/Tokens/AccessToken'
      )

      consumer.get_request_token(oauth_callback: callback_url)
    end
  end
end
