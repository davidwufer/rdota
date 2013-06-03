require 'spec_helper'

include SpecHelper

describe Rdota::Client do
  it 'should return the right league listings'
    # stub_request(:get, )
  # end

  it 'should respond to connection' do
    client.should respond_to(:connection)
  end

  it 'should respond to get' do
    client.should respond_to(:get)
  end
end
