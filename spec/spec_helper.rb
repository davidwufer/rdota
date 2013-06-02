require 'rspec'
require 'json'
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

  def fixture_for(category)
    json = json_for(category)
    class_for_category = class_from_string("Rdota::#{category.capitalize}")

    class_for_category.new(json)
  end

  private
    def test_client
      client = Rdota::Client.new
      client.configure do |configuration|
        configuration.api_key = 'API_KEY'
      end

      client
    end

    def json_for(category)
      filepath = File.expand_path("spec/fixtures/#{category}.json")
      JSON.parse(IO.read(filepath))
    end

    def class_from_string(str)
      str.split('::').inject(Object) do |mod, inner_module|
      mod.const_get(inner_module)
    end
  end
end
