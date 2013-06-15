require 'rdota/bit_operations'

module Rdota
  class MatchDetails < DotaApiObject
  end

  class AdditionalUnit < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :unitname
    attr_reader :item_0, :item_1, :item_2, :item_3, :item_4, :item_5

    def initialize(args = {})
      @unitname = args['unitname']
      @item_0   = args['item_0']
      @item_1   = args['item_1']
      @item_2   = args['item_2']
      @item_3   = args['item_3']
      @item_4   = args['item_4']
      @item_5   = args['item_5']
    end
  end

  class LobbyType < DotaApiObject
    @types = [
      "Invalid",
      "Public matchmaking",
      "Practise",
      "Tournament",
      "Tutorial",
      "Co-op with bots",
      "Team match"
    ]

    class << self
      attr_reader :types
    end

    compare_equality_using :number

    def initialize(number)
      @number = number
    end

    def to_i
      number
    end

    def to_s
      LobbyType.types[number + 1]
    end

    private
      attr_reader :number
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

    compare_equality_using :number

    def initialize(number)
      @number = number
    end

    def to_i
      number
    end

    def to_s
      GameMode.modes[number]
    end

    private
      attr_reader :number
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
