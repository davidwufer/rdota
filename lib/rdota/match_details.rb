require 'rdota/bit_operations'

module Rdota
  class MatchDetails < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :players, :season, :radiant_win, :duration, :start_time,
                :match_id, :match_seq_num, :tower_status_radiant,
                :tower_status_dire, :barracks_status_radiant,
                :barracks_status_dire, :cluster, :first_blood_time,
                :lobby_type, :human_players, :leagueid, :positive_votes,
                :negative_votes, :game_mode, :picks_bans

    def initialize(args = {})
      result = args["result"]
      @players = result["players"].map { |p| Player.new(p) }
      @season  = result["season"]
      @radiant_win = result["radiant_win"]
      @duration = result["duration"]
      @start_time = result["start_time"]
      @match_id = result["match_id"]
      @match_seq_num = result["match_seq_num"]
      @tower_status_radiant = TowerStatus.new(result["tower_status_radiant"])
      @tower_status_dire = TowerStatus.new(result["tower_status_dire"])
      @cluster = result["cluster"]
      @first_blood_time = result["first_blood_time"]
      @lobby_type = LobbyType.new(result["lobby_type"])
      @human_players = result["human_players"]
      @leagueid = result["leagueid"]
      @positive_votes = result["positive_votes"]
      @negative_votes = result["negative_votes"]
      @game_mode = GameMode.new(result["game_mode"])
      @picks_bans = (temp = result["picks_bans"]) && PicksBans.new(temp)
    end
  end

  class Player < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :account_id
    attr_reader :player_slot
    attr_reader :hero_id
    attr_reader :item_0
    attr_reader :item_1
    attr_reader :item_2
    attr_reader :item_3
    attr_reader :item_4
    attr_reader :item_5
    attr_reader :kills
    attr_reader :deaths
    attr_reader :assists
    attr_reader :leaver_status
    attr_reader :gold
    attr_reader :last_hits
    attr_reader :denies
    attr_reader :gold_per_min
    attr_reader :xp_per_min
    attr_reader :gold_spent
    attr_reader :hero_damage
    attr_reader :tower_damage
    attr_reader :hero_healing
    attr_reader :level
    attr_reader :additional_units
    attr_reader :ability_upgrades


    def initialize(args = {})
      @account_id = args['account_id']
      @player_slot = args['player_slot']
      @hero_id = args['hero_id']
      @item_0 = args['item_0']
      @item_1 = args['item_1']
      @item_2 = args['item_2']
      @item_3 = args['item_3']
      @item_4 = args['item_4']
      @item_5 = args['item_5']
      @kills = args['kills']
      @deaths = args['deaths']
      @assists = args['assists']
      @leaver_status = args['leaver_status']
      @gold = args['gold']
      @last_hits = args['last_hits']
      @denies = args['denies']
      @gold_per_min = args['gold_per_min']
      @xp_per_min = args['xp_per_min']
      @gold_spent = args['gold_spent']
      @hero_damage = args['hero_damage']
      @tower_damage = args['tower_damage']
      @hero_healing = args['hero_healing']
      @level = args['level']

      @ability_upgrades = args['ability_upgrades']
      if @ability_upgrades
        @ability_upgrades = @ability_upgrades.map do |au|
                              AbilityUpgrade.new(au)
                            end
      end
      @additional_units = args['additional_units']
      if @additional_units
        @additional_units = @additional_units.map do |au|
                              AdditionalUnit.new(au)
                            end
      end
    end

  end

  class AbilityUpgrade < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :ability, :time, :level

    def initialize(args = {})
      @ability = args['ability']
      @time    = args['time']
      @level   = args['level']
    end
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
    @bits = [
      :ancient_top,
      :ancient_bottom,
      :bottom_tier3,
      :bottom_tier2,
      :bottom_tier1,
      :middle_tier3,
      :middle_tier2,
      :middle_tier1,
      :top_tier3,
      :top_tier2,
      :top_tier1,
    ].reverse.freeze

    class << self
      attr_reader :bits
    end
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
