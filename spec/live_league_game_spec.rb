require 'spec_helper'

include Rdota

describe LiveLeagueGame do
  it_should_behave_like "an api object", fixture_for('league')

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
end
