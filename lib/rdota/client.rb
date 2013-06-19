require 'rdota/connection'
require 'rdota/configuration'

module Rdota
  class Client
    attr_reader :config, :connection

    def initialize(args = {})
      @config     = args[:configuration] || Configuration.new
      @connection = args[:connection] || Connection.new
    end

    def configure
      yield(@config)
    end

    def request(url, params = {})
      response = @connection.request(url, params.merge(key: config.key))
      response.body
    end
  end
end
