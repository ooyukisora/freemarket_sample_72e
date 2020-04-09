class ItemsController < ApplicationController
  def index
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

