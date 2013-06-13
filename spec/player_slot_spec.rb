require 'spec_helper'

include Rdota

describe PlayerSlot do
  describe 'messages' do
    subject { PlayerSlot.new(0) }

    it { should respond_to :radiant? }
    it { should respond_to :position}
  end

  describe 'correctness' do
    let(:playerslot) { PlayerSlot.new(132) }

    it "should return the correct value for radiant?" do
      playerslot.radiant?.should be_false
    end

    it "should return the correct player slot number" do
      playerslot.position.should == 4
    end
  end
end
