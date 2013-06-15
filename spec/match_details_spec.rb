require 'spec_helper'

include Rdota

describe "Match Details" do
  describe AbilityUpgrade do
    it_should_behave_like "an api object", fixture_for("ability_upgrade")

    let(:ability_upgrade) { fixture_for 'ability_upgrade' }

    it "should return the correct ability" do
      ability_upgrade.ability.should == 5152
    end

    it "should return the correct time" do
      ability_upgrade.time.should == 121
    end

    it "should return the correct level" do
      ability_upgrade.level.should == 1
    end
  end

  describe AdditionalUnit do
    it_should_behave_like "an api object", fixture_for("additional_unit")

    let(:additional_unit) { fixture_for 'additional_unit' }

    it "should return the correct unitname" do
      additional_unit.unitname.should == "Spirit Bear"
    end

    expected_items = [0, 1, 2, 3, 4, 5]
    (0..5).each do |slot|
      it "should return the right item in slot #{slot}" do
        additional_unit.send("item_#{slot}".to_sym).should == expected_items[slot]
      end
    end
  end

  describe LobbyType do
    it_should_behave_like "an api object", LobbyType.new(-1)

    let(:lobbytype) { LobbyType.new(-1) }

    it "should return the correct value for to_i" do
      lobbytype.to_i.should == -1
    end

    it "should return the correct value for to_s" do
      lobbytype.to_s.should == "Invalid"
    end
  end

  describe GameMode do
    it_should_behave_like "an api object", GameMode.new(2)

    let(:game_mode) { GameMode.new(2) }

    it "should return the correct value for to_i" do
      game_mode.to_i.should == 2
    end

    it "should return the correct value for to_s" do
      game_mode.to_s.should == "All Random"
    end
  end

  describe TowerStatus do
    describe 'messages' do

      before { pending }

      subject { TowerStatus.new(0) }

      it { should respond_to :ancient_top }
      it { should respond_to :ancient_bottom }
      it { should respond_to :bottom_tier3 }
      it { should respond_to :bottom_tier2 }
      it { should respond_to :bottom_tier1 }
      it { should respond_to :middle_tier3 }
      it { should respond_to :middle_tier2 }
      it { should respond_to :middle_tier1 }
      it { should respond_to :top_tier3 }
      it { should respond_to :top_tier2 }
      it { should respond_to :top_tier1 }
    end
  end

  describe PicksBans do
    it_should_behave_like "an api object", fixture_for('picks_bans')

    let(:picksbans) { fixture_for 'picks_bans' }

    it 'should return the correct value for is_pick' do
      picksbans.is_pick.should be_true
    end

    it 'should return the correct hero_id' do
      picksbans.hero_id.should == 1000
    end

    it "should return the correct value for team" do
      picksbans.team.should be_zero
    end

    it "should return the right order" do
      picksbans.order.should == 19
    end
  end

  describe MatchDetails do
    it "should have an empty list for PicksBans if the mode is captains mode"
  end
end
