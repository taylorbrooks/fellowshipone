require 'faraday'
require 'faraday_middleware'
require 'simple_oauth'

Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

module FellowshipOne
  class Client
    include FellowshipOne::Client::Contribution
    include FellowshipOne::Client::Fund
    include FellowshipOne::Client::Person

    attr_reader :church_code, :consumer_key, :consumer_secret, :token, :secret

    def initialize(church_code, consumer_key, consumer_secret, token, secret)
      @church_code     = church_code
      @consumer_key    = consumer_key
      @consumer_secret = consumer_secret
      @token           = token
      @secret          = secret
    end

    def get(path, options={})
      connection.get do |req|
        req.url(path, options)
      end.body
    end

    def post(path, req_body)
      connection.post do |req|
        req.url(path)
        req.body = req_body
      end.body
    end

    def put(url, options = {})
      connection.put do |req|
        req.url path
      end.body
    end

    def delete(url, options = {})
      connection.delete do |req|
        req.url path
      end.body
    end

    def save
      connection.put do |req|
        req.url path
      end.body
    end

    private

    def connection
      Faraday.new(url: "https://#{church_code}.fellowshiponeapi.com", headers: { accept: 'application/json' }) do |connection|
        connection.request  :oauth, oauth_data
        connection.request  :json
        connection.response :logger
        connection.response :json
        connection.adapter  Faraday.default_adapter
      end
    end

    def oauth_data
      {
        consumer_key:    consumer_key,
        consumer_secret: consumer_secret,
        token:           token,
        token_secret:    secret
      }
    end
  end
end
