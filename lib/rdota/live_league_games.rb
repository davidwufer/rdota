module Rdota
  class LiveLeagueGames
  end

  class Team < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :team_name, :team_id, :team_logo, :complete

    def initialize(args = {})
      @team_name = args["team_name"]
      @team_id   = args["team_id"]
      @team_logo = args["team_logo"]
      @complete  = args["complete"]
    end
  end

  class Player < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :account_id, :name, :hero_id, :team

    def initialize(args = {})
      @account_id = args['account_id']
      @name       = args['name']
      @hero_id    = args['hero_id']
      @team       = args['team']
    end
  end

  class TowerState
      # TODO: These should probably be symbols
      @towerstate_bits = %w[
        radiant_top_tier1
        radiant_top_tier2
        radiant_top_tier3
        radiant_middle_tier1
        radiant_middle_tier2
        radiant_middle_tier3
        radiant_bottom_tier1
        radiant_bottom_tier2
        radiant_bottom_tier3
        radiant_ancient_bottom
        radiant_ancient_top
        dire_top_tier1
        dire_top_tier2
        dire_top_tier3
        dire_middle_tier1
        dire_middle_tier2
        dire_middle_tier3
        dire_bottom_tier1
        dire_bottom_tier2
        dire_bottom_tier3
        dire_ancient_bottom
        dire_ancient_top
      ].reverse.freeze

    class << self
      attr_reader :towerstate_bits
    end

    def initialize(number = 0)
      @number = truncate_to_32_bits(number)
    end


    def method_missing(method, *args, &block)
      bit_value_for(method)
    end

    def respond_to?(method, include_private = false)
      TowerState.towerstate_bits.include?(method) || super
    end

    private
      def truncate_to_32_bits(num)
        num & (2**31 - 1)
      end

      def bit_value_for(category)
        index = TowerState.towerstate_bits.find_index(category.to_s)
        (@number >> index) & 1
      end
  end
end
