require 'rdota/connection'
require 'rdota/configuration'

module Rdota
  class Client
    def initialize(args = {})
      @config = args[:configuration] || Configuration.new
    end

    def connection
      @connection ||= Connection.new
    end

    def get(url, params = {})
      @connection.request(url, params)
    end
  end
end
