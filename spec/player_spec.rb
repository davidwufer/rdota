require 'spec_helper'

include Rdota

describe Player do
  let(:player) { fixture_for 'player' }

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

  it 'should be equal to another player with the same instance variables' do
    player.should == fixture_for('player')
  end

end
