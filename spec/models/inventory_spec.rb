require 'spec_helper'

describe Inventory do
  let(:inventory) { build(:inventory) }
  let(:product) { build(:product) }
  before(:all) do
    Inventory.delete_all
    Product.delete_all
  end

  after(:all) do
    Inventory.delete_all
    Product.delete_all
  end

  it "should exist" do
    expect(inventory).to be_valid
  end

  it "should have a quatity" do
    expect(inventory.qty).not_to be_nil
  end

  it "should have a date created" do
    product.inventories.push(inventory)
    inventory.save
    expect(inventory.created_at).not_to be_nil
  end
end
