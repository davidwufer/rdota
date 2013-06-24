module Rdota
  class PlayerSlot < DotaApiObject
    @max_bits = 8
    class << self
      attr_reader :max_bits
    end

    def initialize(number = 0)
      @number = mask(number, PlayerSlot.max_bits)
    end

    def radiant?
      bit_value_for(PlayerSlot.max_bits).zero?
    end

    # A player's position in his/her team (0-4)
    def position
      # 2 ** 3 - 1
      @number & 7
    end

    private
      attr_reader :number

      def mask(number, bits)
        number & ((2 ** bits) - 1)
      end

      def bit_value_for(nth_bit)
        (number >> (nth_bit - 1)) & 1
      end
  end
end
