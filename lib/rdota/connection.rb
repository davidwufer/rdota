module Rdota
  class Connection
    attr_reader :faraday

    def initialize(args = {})
      @faraday = args[:faraday] || default_faraday
    end

    def request(url, params = {})
      faraday.get(url, params)
    end
  end
end
