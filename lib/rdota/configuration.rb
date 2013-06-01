module Rdota
  class Configuration
    attr_accessor :api_key

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(@configuration) if block_given?
    end

  end
end
