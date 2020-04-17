class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipday
  belongs_to :user
  belongs_to :category
  
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
    def favorite_user(user_id)
      favorites.find_by(user_id: user_id)
    end
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :price, :text, :status, 
    :delivery_fee, :from_area, :shipping_day, :category_id, presence: true
  
  # validates :images, presence: true
end
