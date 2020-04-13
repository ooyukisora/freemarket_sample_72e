class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = ["---"]
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
      render :new
    end
  end
  
  

  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @address = Address.find(@item.user_id)
    # @image = Image.find(@item.image_id)
    @parents = Category.where(ancestry:nil)
  end
  
  def comfilm
    
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end




  
  private

  def item_params
    params.require(:item).permit(:name, :text, :price, 
      :category_id, :status, :delivery_fee, :shipping_day, 
      :from_area, images_attributes: [:img]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end

