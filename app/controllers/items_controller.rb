class ItemsController < ApplicationController
  def new
    @item = Item.new
    if session[:logged_in?]
      render :new
    else
      redirect_to root_path
    end
  end

  def create
  end
end
