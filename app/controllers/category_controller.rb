class CategoryController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: nil)
  end
end
