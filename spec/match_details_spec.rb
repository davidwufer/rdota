require 'spec_helper'

include Rdota

describe "Match Details" do
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
