class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
  end
  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status, :delivery_fee, :shipping_day, :from_area, images_attributes: [:img]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @address = Address.find(@item.user_id)
    #@image = Image.find(@item.image_id)

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
    params.require(:item).permit(:name)
  end
end

