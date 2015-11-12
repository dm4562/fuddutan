class ItemsController < ApplicationController
  def index
    if gt_user_signed_in?
      @current_user = current_gt_user
      if @current_user = current_gt_user
        @grid = initialize_grid(Item,
          include: [:building, :item_type, :return_user],
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

  def update
    @item = Item.find params[:id]
    if @item.update(item_params)
      flash[:success] = "Item returned!"
      redirect_to items_path
    else
      redirect_to new_return_user_path
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  private

  def item_params
    allow = [:building_id, :where_found, :when_found, :item_type_id, :title, :description, :has_id, :return_user_id]
    params.require(:item).permit(allow)
  end

  def update_item_params
    allow = [:building_id, :where_found, :when_found, :item_type_id, :title, :description]
    params.require(:item).permit(allow)
  end
end
