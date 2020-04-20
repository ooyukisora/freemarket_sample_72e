class UsersController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @items = Item.all
  end

  def destroy
  end

  def logout
  end

end
