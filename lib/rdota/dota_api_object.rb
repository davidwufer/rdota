require 'rdota/equality'

module Rdota
  class DotaApiObject
    include Equality
  end

  class BitFlagDotaApiObject
    include Equality

    compare_equality_using :number
    attr_reader :number

    def initialize(number = 0)
      @number = mask(number)
    end

    def bit_array
      self.class.bits
    end

    def method_missing(method, *args, &block)
      bit_array.include?(method) ? bit_value_for(method) : super
    end

    def respond_to?(method, include_private = false)
      bit_array.include?(method) || super
    end

    private
      def mask(number)
        number & ((2 ** bit_array.size) - 1)
      end

      def bit_value_for(category)
        index = bit_array.find_index(category)
        (number >> index) & 1
      end
  end
end
