require 'spec_helper'

describe "index route" do

  it "should be return login" do
    get '/'
    expect(last_response).to be_redirect
  end


  it "should have a Title bar" do
    get '/'
    follow_redirect!
    expect(last_response.body).to include('Juice FM')
  end

  it "should have a footer bar" do
    get '/'
    follow_redirect!
    expect(last_response.body).to include('footer')
  end

  it "should have a login form" do
    get '/'
    follow_redirect!
    expect(last_response.body).to include('Please login')
  end
end
