require 'spec_helper'

describe User do
  let(:user) { build(:user) }

  it "should exist" do
    expect(user).to be_valid
  end

  it "should have a first name" do
    expect(user.first_name).not_to be_empty
  end

  it "should have a last name" do
    expect(user.last_name).not_to be_empty
  end

  it "should have an email address" do
    expect(user.email).not_to be_empty
  end

  it "should have an admin option" do
    expect(user.is_admin?).to be(false)
  end

  it "should have an first address" do
    expect(user.address_one).not_to be_empty
  end

  it "should have an second address" do
    expect(user.address_two).not_to be_empty
  end

  it "should have a phone number" do
    expect(user.phone).not_to be_empty
  end

  it "should have a city" do
    expect(user.city).not_to be_empty
  end

  it "should have a zip code" do
    expect(user.zip).not_to be_nil
  end

  it "should have a state" do
    expect(user.state).not_to be_empty
  end
end
