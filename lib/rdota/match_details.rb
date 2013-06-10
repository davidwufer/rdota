module Rdota
  class BarracksStatus < DotaApiObject
    @status_bits = %w[
      bottom_ranged
      bottom_melee
      middle_ranged
      middle_melee
      top_ranged
      top_melee
    ].map(&:to_sym).reverse.freeze

    class << self
      attr_reader :status_bits
    end

    compare_equality_using :number
    attr_reader :number

    def initialize(number = 0)
      @number = number
    end

    def method_missing(method, *args, &block)
      bit_value_for(method)
    end

    def respond_to?(method, include_private = false)
      BarracksStatus.status_bits.include?(method) || super
    end

    private
      def mask_8_bits(number)
        number & ((2 ** 8) - 1)
      end

      def bit_value_for(category)
        index = BarracksStatus.status_bits.find_index(category)
        (number >> index) & 1
      end
  end
end
