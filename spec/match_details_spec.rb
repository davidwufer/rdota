require 'spec_helper'

include Rdota

describe "Match Details" do
  describe MatchDetails do
    before { pending }

    describe "internal objects" do
      it { should respond_to "lobby_type" }
      it { should respond_to "game_mode" }
      it { should respond_to "picks_bans" }
      it { should respond_to "tower_status_radiant" }
      it { should respond_to "tower_status_dire" }
      it { should respond_to "barracks_status_radiant" }
      it { should respond_to "barracks_status_dire" }

    end

    it "should return the correct season" do
      player.season.should == 0
    end

    it "should return the correct value for radiant_win" do
      player.radiant_win.should be_true
    end

    it "should return the correct duration" do
      player.duration.should == 1975
    end

    it "should return the correct start_time" do
      player.start_time.should == 1370506963
    end

    it "should return the correct match_id" do
      player.match_id.should == 212743691
    end

    it "should return the correct math_seq_num" do
      player.match_seq_num.should == 191744529
    end

    it "should return the right cluster" do
      player.cluster.should == 182
    end

    it "should return the correct first blood time" do
      player.first_blood_time.should == 84
    end

    it "should return the correct lobby_type" do
      player.lobby_type.should == 0
    end

    it "should return the correct value for human players" do
      player.human_players.should == 10
    end

    it "should return the correct leagueid" do
      player.leagueid.should == 0
    end

    it "should return the " do

    end
  end

  describe Player do
    it_should_behave_like "an api object", fixture_for("ability_upgrade")
    let(:player) { fixture_for 'player' }

    describe "internal objects" do
      subject { player }

      it { should respond_to "ability_upgrades" }
      it { should respond_to "additional_units" }
    end

    it "should return the correct account_id" do
      player.account_id.should == 4294967295
    end

    it "should return the correct player_slot" do
      player.player_slot.should == 0
    end

    it "should return the correct hero_id" do
      player.hero_id.should == 34
    end

    expected_items = [1, 41, 178, 48, 34, 40]
    (0..5).each do |slot|
      it "should return the correct item_#{slot}" do
        player.send("item_#{slot}".to_sym).should == expected_items[slot]
      end
    end

    it "should return the correct number of kills" do
      player.kills.should == 5
    end

    it "should return the correct number of deaths" do
      player.deaths.should == 18
    end

    it "should return the correct number of assists" do
      player.assists.should == 11
    end

    it "should return the correct value for leaver_status" do
      player.leaver_status.should == 0
    end

    it "should return the correct amount of gold" do
      player.gold.should == 1085
    end

    it "should return the correct number of last_hits" do
      player.last_hits.should == 161
    end

    it "should return the correct number of denies" do
      player.denies.should == 2
    end

    it "should return the correct gpm" do
      player.gold_per_min.should == 288
    end

    it "should return the correct xpm" do
      player.xp_per_min.should == 358
    end

    it "should return the correct amount of gold_spent" do
      player.gold_spent.should == 7668
    end

    it "should return the correct amount of hero_damage" do
      player.hero_damage.should == 14717
    end

    it "should return the correct amount of tower_damage" do
      player.tower_damage.should == 449
    end

    it "should return the correct amount of hero_healing" do
      player.hero_healing.should == 0
    end

    it "should return the correct level" do
      player.level.should == 19
    end
  end

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
