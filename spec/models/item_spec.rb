require 'rails_helper'
# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Item do

  it "is invalid without a name" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:name]).to include("can't be blank")
  end

  it "is invalid without a price" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:price]).to include("can't be blank")
  end

  it "is invalid without a text" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:text]).to include("can't be blank")
  end

  it "is invalid without a status" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:status]).to include("can't be blank")
  end

  it "is invalid without a delivery_fee" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:delivery_fee]).to include("can't be blank")
  end

  it "is invalid without a from_area" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:from_area]).to include("can't be blank")
  end

  it "is invalid without a shipping_day" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:shipping_day]).to include("can't be blank")
  end

  it "is invalid without a category_id" do
    item = Item.new()
    item.valid?
    expect(item.errors.messages[:category_id]).to include("can't be blank")
  end
end
