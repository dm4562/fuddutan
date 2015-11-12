class ReturnUsersController < ApplicationController

  def new
    @return_user = ReturnUser.new
    session[:return_user_item_id] ||= params[:item_id]
    @item = Item.find(session[:return_user_item_id])
    if gt_user_signed_in?
      render :new
    else
      redirect_to new_gt_user_session_path
    end
  end

  def create
    @return_user = ReturnUser.new(return_user_params)
    if @return_user.save
      @item = Item.find(session[:return_user_item_id])
      @item.return_user_id = @return_user.id
      if @item.save
        flash[:success] = "Person created and item returned!"
        session[:return_user_item_id] = nil
        redirect_to items_path
      else
        redirect_to new_return_user_path
      end
    else
      redirect_to new_return_user_path
    end
  end

  def show
    @return_user = ReturnUser.find(params[:id])
  end

  private
  def return_user_params
    allow = [:name, :gtid, :state_id]
    params.require(:return_user).permit(allow)
  end

  def item_params
    allow = [:return_user_id]
    params.require(:item).permit(allow)
  end
end
