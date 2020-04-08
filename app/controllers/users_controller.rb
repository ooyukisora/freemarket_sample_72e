class UsersController < ApplicationController

  def index
    @items = Item.all
  end

  def show
  end

  def destroy
  end

  def logout
  end

end
