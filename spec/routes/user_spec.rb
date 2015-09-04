require 'spec_helper'

describe "user auth" do
  let(:user) { build(:user) }
  let(:admin) { build(:admin) }
  after :each do
    Warden.test_reset!
  end

  context 'user login valid' do
    before :each do
      get '/auth/logout'
    end

    it "should login with user" do
      login_as user
      get '/'
      expect(last_response.body).to include('Welcome to Juice FM!')
    end

    it "should redirect non admin users" do
      login_as user
      get '/admin'
      puts 'what: ' + last_response.body
      expect(last_response.body).to include('Welcome to Juice FM')
    end

    it "should allow to admin page" do
      login_as admin
      get '/admin'
      expect(last_response.body).to include("Admin Page")
    end
  end

  # context 'user logout' do
  #   it "should log out" do
  #     login_as user
  #
  #     # get '/auth/logout'
  #     logout
  #     get '/'
  #     follow_redirect!
  #     expect(last_response.body).to include('Please login')
  #   end
  # end
end
