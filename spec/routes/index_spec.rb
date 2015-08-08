require 'spec_helper'

describe "index route" do

  it "should be return index" do
    get '/'
    expect(last_response).to be_ok
  end


  it "should have a Title bar" do
    get '/'
    expect(last_response.body).to include('JuiceFM')
  end

  it "should have a footer bar" do
    get '/'
    expect(last_response.body).to include('bar-footer')
  end

  it "should have a login form" do
    get '/'
    expect(last_response.body).to include('Please login')
  end
end
