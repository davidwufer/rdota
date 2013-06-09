require 'rspec'
require 'json'
require 'rdota'
require 'webmock/rspec'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

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
    classname = camelize(category)
    class_for_category = class_from_string("Rdota::#{classname}")

    class_for_category.new(json)
  end

  # TODO: this should be a method on String
  def camelize(str)
    str.split('_').map(&:capitalize).join
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
