require 'spec_helper'

describe Rdota::LeagueListing do
  it_should_behave_like "an api object", fixture_for('league_listing')

  let(:league_listing) { fixture_for 'league_listing' }
  let(:league1) do
    League.new(
        "name" => "#DOTA1",
        "leagueid" => 1,
        "description" => "League Description 1",
        "tournament_url" => "http://www.dota.com/1/"
      )
  end

  let(:league2) do
      League.new(
        "name" => "#DOTA2",
        "leagueid" => 2,
        "description" => "League Description 2",
        "tournament_url" => "http://www.dota.com/2/"
      )
  end

  it 'should return the correct leagues' do
    league_listing.leagues.should == [league1, league2]
  end
end
