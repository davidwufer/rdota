require 'rdota/bit_operations'

module Rdota
  class MatchDetails < DotaApiObject
  end

  class GameMode < DotaApiObject
    @modes = [
      "All Pick",
      "Single Draft",
      "All Random",
      "Random Draft",
      "Captain's Draft",
      "Captain's Mode",
      "Death Mode",
      "Diretide",
      "Reverse Captain's Mode",
      "The Greeviling",
      "Tutorial",
      "Mid Only",
      "Least Played",
      "New Player Pool"
    ]

    class << self
      attr_reader :modes
    end

    attr_reader :number

    def initialize(number = 0)
      @number = number
    end

    def to_i
      number
    end

    def to_s
      GameMode.modes[number]
    end
  end

  class PicksBans < DotaApiObject
    compare_equality_using_instance_variables

    attr_reader :is_pick, :hero_id, :team, :order
    def initialize(args = {})
      @is_pick = args['is_pick']
      @hero_id = args['hero_id']
      @team    = args['team']
      @order   = args['order']
    end
  end

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

  class TowerStatus < BitFlagDotaApiObject
    # This is very similar to live_league_games.towerstate
  end

  class BarracksStatus < BitFlagDotaApiObject
    @bits = [
      :bottom_ranged,
      :bottom_melee,
      :middle_ranged,
      :middle_melee,
      :top_ranged,
      :top_melee
    ].reverse.freeze

    class << self
      attr_reader :bits
    end
  end
end
