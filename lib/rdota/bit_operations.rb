module Rdota
  module BitOperations
    def self.included(parent)
      class << parent
        def initialize_bit_operations_for(bit_array)
          define_method(:bit_array) do
            bit_array
          end
        end
      end

      include Equality
      compare_equality_using :number
      attr_reader :number

      def initialize(number = 0)
        @number = mask(number)
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
end
