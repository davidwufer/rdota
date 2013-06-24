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
