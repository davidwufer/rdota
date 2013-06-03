require 'spec_helper'

include Rdota

describe League do
  let(:league) { fixture_for('league') }

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

  it 'should be equal to another league with the same information' do
    league.should == fixture_for('league')
  end
end
