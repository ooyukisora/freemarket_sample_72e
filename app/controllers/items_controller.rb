class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :destroy, :update]

  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      
    else
      redirect_to new_item_path
      
    end
  end
  
  def show
    @user = User.find(@item.user_id)
    # @address = Address.find(@item.user_id)
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end
  
  def comfilm
  end

  def destroy
    
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def edit
    
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end




  
  private

  def item_params
    
    params.require(:item).permit(:name, :text, :price, 
      :category_id, :status, :delivery_fee, :shipping_day, 
      :from_area, images_attributes: [:img, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

