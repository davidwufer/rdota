require 'spec_helper'

include Rdota

describe BarracksStatus do
  it_should_behave_like "an api object", BarracksStatus.new(0)

  describe "responses" do
    subject { BarracksStatus.new(0) }

    it { should respond_to :bottom_ranged }
    it { should respond_to :bottom_melee }
    it { should respond_to :middle_ranged }
    it { should respond_to :middle_melee }
    it { should respond_to :top_ranged }
    it { should respond_to :top_melee }
  end

  it "should return the correct value for bottom_ranged" do
    barracks_status = BarracksStatus.new(32)

    barracks_status.bottom_ranged.should == 1
  end
end
