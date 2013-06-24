require 'spec_helper'

include Rdota

describe MatchHistory do
  it_should_behave_like "an api object", fixture_for('match_history')

  let(:match_history) { fixture_for 'match_history' }

  it "should return the correct status" do
    match_history.status.should == 1
  end

  it "should return an empty string" do
    match_history.status_detail.should == ""
  end

  it "should return the correct num_results" do
    match_history.num_results.should == 25
  end

  it "should return the correct number of total_results" do
    match_history.total_results.should == 500
  end

  it "should return the correct number of results_remaining" do
    match_history.results_remaining.should == 475
  end

  it "should respond to matches" do
    match_history.should respond_to(:matches)
  end
end

describe Match do
  it_should_behave_like "an api object", fixture_for('match_history')

  let(:match) { fixture_for 'match' }

  it "should return the correct match_id" do
    match.match_id.should == 226733829
  end

  it "should return the correct match_seq_num" do
    match.match_seq_num.should == 204926641
  end

  it "should return the correct starting time" do
    match.start_time.should == 1372045082
  end

  describe "messages" do
    it "should respond_to lobby_type" do
      match.should respond_to(:lobby_type)
    end

    it "should respond to players" do
      match.should respond_to(:players)
    end
  end
end

describe MatchPlayer do
  it_should_behave_like "an api object", fixture_for('match_player')

  let(:match_player) { fixture_for 'match_player' }

  describe "messages" do
    it "should respond to player_slot" do
      match_player.should respond_to(:player_slot)
    end
  end

  it "should return the correct account_id" do
    match_player.account_id.should == 4294967295
  end

  it "should return the correct hero_id" do
    match_player.hero_id.should == 59
  end
end

