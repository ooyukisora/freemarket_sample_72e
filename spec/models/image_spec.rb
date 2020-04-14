require 'rails_helper'

describe Image do
  describe '#create' do

    it "img がないと登録できない" do
      item = Image.new()
      item.valid?
      expect(item.errors.messages[:img]).to include("can't be blank")
    end

    it "is valid with a image" do
      item = FactoryBot.build(:item)
      image = FactoryBot.build(:image)
      expect(image).to be_valid
    end
  end
end