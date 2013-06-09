shared_examples "an api object" do |api_obj|
  it 'should be == to another object with the same attributes' do
    api_obj.should == api_obj.clone
  end

  it 'should have the same hash key as another object with the same attributes' do
    api_obj.hash.should == api_obj.clone.hash
  end
end

