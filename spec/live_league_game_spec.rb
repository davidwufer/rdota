require 'spec_helper'

include Rdota

describe LiveLeagueGame do
  let(:live_league_game) { fixture_for 'live_league_game' }

  it 'should respond to players' do
    live_league_game.should respond_to(:players)
  end

  it 'should respond to radiant_team' do
    live_league_game.should respond_to(:radiant_team)
  end

  it 'should respond to dire_team' do
    live_league_game.should respond_to(:dire_team)
  end

  it 'should return the correct lobby_id' do
    live_league_game.lobby_id.should == 100
  end

  it 'should return the correct number of spectators' do
    live_league_game.spectators.should == 1
  end

  it 'should respond to tower_state' do
    live_league_game.should respond_to(:tower_state)
  end

  it 'should return the correct league_id' do
    live_league_game.league_id.should == 47
  end

  it 'should be equal to another object with the same attributes' do
    new_live_league_game = fixture_for 'live_league_game'

    live_league_game.should == new_live_league_game
  end

  it 'should have the same hash key as another object with the same attributes' do
    new_live_league_game = fixture_for 'live_league_game'

    live_league_game.hash.should == new_live_league_game.hash
  end
end
