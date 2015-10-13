class ItemsController < ApplicationController
  def index
    if gt_user_signed_in?
      @current_user = current_gt_user
      if @current_user = current_gt_user
        @grid = initialize_grid(Item,
          include: [:building, :item_type],
          order: 'items.when_found',
          order_direction: 'desc'
          )
      else
        redirect_to new_gt_user_session_path
      end
    end
  end

  def new
    @item = Item.new
    if gt_user_signed_in?
      render :new
    else
      redirect_to new_gt_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item succesfully added"
      redirect_to items_path
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
