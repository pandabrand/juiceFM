require 'spec_helper'

describe Product do
  let(:product) { build(:product)}

  it "should exist" do
    expect(product).to be_valid
  end

  it "should have a name" do
    expect(product.name).not_to be_empty
  end

  it "should have an ingredient array" do
    expect(product.ingredient).not_to be_empty
  end

  it "should have a description" do
    expect(product.description).not_to be_empty
  end

  it "should have a price" do
    expect(product.price).not_to be_nil
  end

  it "should have a type" do
    expect(product.type).not_to be_empty
  end

  it "should have a category" do
    expect(product.category).not_to be_empty
  end

  it "should have inventory records" do
    expect(product.inventory).not_to be_empty
  end
end
