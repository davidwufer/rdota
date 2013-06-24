require "rdota/version"

require 'rdota/client'
require 'rdota/league_listing'
require 'rdota/live_league_games'
require 'rdota/match_details'
require 'rdota/match_history'

# Shared objects
require 'rdota/lobby_type'
require 'rdota/player_slot'

require 'rdota/game'

module Rdota
  def self.client
    @client ||= Client.new
  end
end
