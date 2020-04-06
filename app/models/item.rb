class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  # belongs_to :image, class_name: "Image"
  has_many :images 
  belongs_to :user
  
  accepts_nested_attributes_for :images
end
