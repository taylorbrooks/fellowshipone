require 'faraday'
require 'faraday_middleware'
require 'simple_oauth'
require 'json'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}

module Fellowshipone
  class Client
    include Fellowshipone::Client::Communication
    include Fellowshipone::Client::Contribution
    include Fellowshipone::Client::Fund
    include Fellowshipone::Client::Household
    include Fellowshipone::Client::Person

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
        connection.request  :json
        connection.request  :oauth, oauth_data
        connection.response :logger
        connection.use      FaradayMiddleware::Mashify
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
