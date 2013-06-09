require 'spec_helper'

include Rdota

describe LeaguePlayer do
  it_should_behave_like "an api object", fixture_for('league_player')

  let(:player) { fixture_for 'league_player' }

  it 'should return the correct account_id' do
    player.account_id.should == 12196957
  end

  it 'should return the correct name' do
    player.name.should == "David"
  end

  it 'should return the correct hero_id' do
    player.hero_id.should == 0
  end

  it 'should return the correct team' do
    player.team.should == 2
  end
end
