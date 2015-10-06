class ItemsController < ApplicationController
  def index
    @grid = initialize_grid(Item,
      include: [:building, :item_type],
      order: 'items.when_found',
      order_direction: 'desc'
      )
  end

  def new
    @item = Item.new
    if session[:logged_in?]
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item succesfully added"
      redirect_to index
    else
      render 'new'
    end
  end

  private

  def item_params
    allow = [:building_id, :where_found, :when_found, :item_type_id, :title, :description, :has_id]
    params.require(:item).permit(allow)
  end
end
