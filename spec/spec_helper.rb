require 'rspec'
require 'rdota'
require 'webmock/rspec'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

#TODO: Maybe refactor this so the client is only created for tests that need it
module SpecHelper
  def client
    @client ||= test_client
  end

  private
    def test_client
      client = Rdota::Client.new
      client.configure do |configuration|
        configuration.api_key = 'API_KEY'
      end

      client
    end
end
