module Rdota
  class Game < DotaApiObject
    attr_reader :players, :radiant_team, :dire_team, :lobby_id,
                :spectators, :tower_state, :league_id

    def initialize(args = {})
      @players      = args['players'].map { |p| Player.new(p) }
      @radiant_team = Team.new(args['radiant_team'])
      @dire_team    = Team.new(args['dire_team'])
      @lobby_id     = args['lobby_id']
      @spectators   = args['spectators']
      @tower_state  = args['tower_state']
      @league_id    = args['league_id']
    end
  end
end
