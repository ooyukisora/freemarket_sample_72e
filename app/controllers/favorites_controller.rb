class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: params[:item_id])
    @favorites = Favorite.where(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
    
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, item_id: params[:id])
    favorite.destroy
    @favorites = Favorite.where(item_id: params[:id])
    @item = Item.find(params[:id])
    
  end
end
