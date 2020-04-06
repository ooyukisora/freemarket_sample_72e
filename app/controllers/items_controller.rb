class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
  end
  def new
    @item = Item.new
    @item.images.new
    # @location = current_user.address.prefecture
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
    params.require(:item).permit(:name, :text, :price, :status, :delivery_fee, :shipping_day, :from_area, images_attributes: [:img]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
  
end
