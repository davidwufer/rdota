require 'spec_helper'

include Rdota

describe League do
  it_should_behave_like "an api object", fixture_for('league')

  let(:league) { fixture_for 'league' }

  it 'should return the correct name' do
    league.name.should == "#DOTA"
  end

  it 'should return the correct leagueid' do
    league.leagueid.should == 0
  end

  it 'should return the correct description' do
    league.description.should == "League Description"
  end

  it 'should return the correct tournament_url' do
    league.tournament_url.should == "http://www.dota.com"
  end
end
