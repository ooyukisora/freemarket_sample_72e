class Image < ApplicationRecord
  belongs_to :item, class_name: "Item"
end
