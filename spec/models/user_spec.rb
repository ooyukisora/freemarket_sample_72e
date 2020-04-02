require 'rails_helper'
describe User do
  
    it "is invalid without a nickname" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:nickname]).to include("can't be blank")
    end
  

    it "is invalid without a farst_name" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:farst_name]).to include("can't be blank")
    end
  

  
    it "is invalid without a last_name" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:last_name]).to include("can't be blank")
    end
  

  
    it "is invalid without a farst_name_kana" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:farst_name_kana]).to include("can't be blank")
    end
  

  
    it "is invalid without a last_name_kana" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:last_name_kana]).to include("can't be blank")
    end
  

  
    it "is invalid without a birthday" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:birthday]).to include("can't be blank")
    end
  

  
    it "is invalid without a email" do
      user = User.new()
      user.valid?
      expect(user.errors.messages[:email]).to include("can't be blank")
    end
  

  it "is valid with a password that has more than 7 characters " do
    user = FactoryBot.build(:user, password: "0000000", password_confirmation: "0000000")
    user.valid?
    expect(user).to be_valid
  end

  it "is invalid with a duplicate email address" do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end

  it "is invalid without a password_confirmation although with a password" do
    user = FactoryBot.build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end


  
end