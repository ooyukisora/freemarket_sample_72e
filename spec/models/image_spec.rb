require 'rails_helper'

describe Image do
  describe '#create' do
    it "img がないと登録できない" do
      item = Image.new()
      item.valid?
      expect(item.errors.messages[:img]).to include("can't be blank")
    end
  end
end