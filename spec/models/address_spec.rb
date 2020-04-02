require 'rails_helper'
describe Address do

  describe '#create' do
    it "is invalid without a first_name" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:last_name]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a postal" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:postal]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a municipality" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:municipality]).to include("can't be blank")
    end

    it "is invalid without a address" do
      address = Address.new
      address.valid?
      expect(address.errors.messages[:address]).to include("can't be blank")
    end
  end

end