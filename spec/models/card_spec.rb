require 'rails_helper'

# RSpec.describe Card, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Card do
    it "is invalid without a user" do
      card = Card.new()
      card.valid?
      expect(card.errors[:user]).to include("can't be blank")
    end

    it "is invalid without a customer_id" do
      card = Card.new()
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without a card_id" do
      card = Card.new()
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
end