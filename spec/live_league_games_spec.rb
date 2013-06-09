require 'spec_helper'

include Rdota

describe LiveLeagueGames do
  it_should_behave_like "an api object", fixture_for('live_league_games')

  let(:live_league_games) { fixture_for 'live_league_games' }

  it 'should respond to games' do
    live_league_games.should respond_to(:games)
  end

end
