require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:nickname]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a farst_name" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:farst_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a last_name" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:last_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a farst_name_kana" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:farst_name_kana]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a last_name_kana" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:last_name_kana]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a birthday" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:birthday]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a email" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:email]).to include("can't be blank")
    end
  end


  
end