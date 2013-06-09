require 'spec_helper'

include Rdota

describe Game do
  it_should_behave_like "an api object", fixture_for('game')

  let(:game) { fixture_for 'game' }

  it 'should respond to players' do
    game.should respond_to :players
  end

  it 'should respond to radiant_team' do
    game.should respond_to :radiant_team
  end

  it 'should respond to dire_team' do
    game.should respond_to :dire_team
  end

  it 'should return the right lobby_id' do
    game.lobby_id.should == 100
  end

  it 'should return the right number of spectators' do
    game.spectators.should == 311
  end

  it 'should respond to tower_state' do
    game.should respond_to :tower_state
  end

  it 'should return the correct league_id' do
    game.league_id.should == 47
  end
end
