module Rdota
  class MatchHistory < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :status, :status_detail, :num_results,
                :total_results, :results_remaining, :matches

    def initialize(args = {})
      result = args['result']
      @status        = result['status']
      @status_detail = result['status_detail'] || ""
      @num_results   = result['num_results']
      @total_results = result['total_results']
      @results_remaining = result['results_remaining']
      @matches           = result['matches'].map { |m| Match.new(m) }
    end
  end

  class Match < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :match_id, :match_seq_num,
                :start_time, :lobby_type, :players

    def initialize(args = {})
      @match_id      = args['match_id']
      @match_seq_num = args['match_seq_num']
      @start_time    = args['start_time']
      @lobby_type    = LobbyType.new(args['lobby_type'])
      @players       = args['players'].map { |p| MatchPlayer.new(p) }
    end
  end

  class MatchPlayer < DotaApiObject
    compare_equality_using_instance_variables

    attr_reader :account_id, :player_slot, :hero_id

    def initialize(args = {})
      @account_id  = args['account_id']
      @player_slot = PlayerSlot.new(args['player_slot'])
      @hero_id     = args['hero_id']
    end
  end
end
