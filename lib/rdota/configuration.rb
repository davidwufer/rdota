module Rdota
  class Configuration
    attr_accessor :key

    def initialize(args = {})
      args.each_pair do |name, value|
        setter = "#{name}="

        if respond_to?(setter)
          public_send(setter, value)
        end
      end
    end
  end
end
