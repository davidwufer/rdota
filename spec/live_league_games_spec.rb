require 'spec_helper'

include Rdota

describe LiveLeagueGames do
  let(:live_league_games) { fixture_for 'live_league_games' }

  it 'should respond to games' do
    live_league_games.should respond_to(:games)
  end

  it 'should be equal to another live_league_games if the games are equal' do
    new_live_league_games = fixture_for('live_league_games')

    live_league_games.should == new_live_league_games
  end

  it "should have a hash equal to another live_league_games' if the games are equal" do
    new_live_league_games = fixture_for('live_league_games')

    live_league_games.hash.should == new_live_league_games.hash
  end
end
