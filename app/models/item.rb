class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  has_many :comments

  belongs_to :address
end
