require 'spec_helper'

include Rdota

describe TowerState do
  it_should_behave_like "an api object", TowerState.new(1)

  let(:towerstate) { TowerState.new(1) }

  describe 'basic methods' do
  # subject { TowerState.new }

    it { should respond_to 'dire_ancient_top' }
    it { should respond_to 'dire_ancient_bottom' }
    it { should respond_to 'dire_bottom_tier3' }
    it { should respond_to 'dire_bottom_tier2' }
    it { should respond_to 'dire_bottom_tier1' }
    it { should respond_to 'dire_middle_tier3' }
    it { should respond_to 'dire_middle_tier2' }
    it { should respond_to 'dire_middle_tier1' }
    it { should respond_to 'dire_top_tier3' }
    it { should respond_to 'dire_top_tier2' }
    it { should respond_to 'dire_top_tier1' }

    it { should respond_to 'radiant_ancient_top' }
    it { should respond_to 'radiant_ancient_bottom' }
    it { should respond_to 'radiant_bottom_tier3' }
    it { should respond_to 'radiant_bottom_tier2' }
    it { should respond_to 'radiant_bottom_tier1' }
    it { should respond_to 'radiant_middle_tier3' }
    it { should respond_to 'radiant_middle_tier2' }
    it { should respond_to 'radiant_middle_tier1' }
    it { should respond_to 'radiant_top_tier3' }
    it { should respond_to 'radiant_top_tier2' }
    it { should respond_to 'radiant_top_tier1' }
  end


  it 'should return the right value for dire_ancient_top' do
    towerstate.dire_ancient_top.should == 1
  end
end

