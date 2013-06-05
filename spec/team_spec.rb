require 'spec_helper'

include Rdota

describe Team do
  let(:team) { fixture_for "team" }

  it "should return the right team name" do
    team.team_name.should == "GetSome"
  end

  it "should return the right team id" do
    team.team_id.should == "100"
  end

  it "should return the right team_logo" do
    team.team_logo.should == "some_id"
  end

  it "should return the right 'complete'" do
    team.complete.should == "yes"
  end

  it "should be == to another team with the same attributes" do
    team.should == fixture_for("team")
  end

  it "should have the same hash key as another team with the same attributes" do
    team.hash.should == fixture_for("team").hash
  end
end
