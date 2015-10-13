class GtUsersController < ApplicationController

  def show
    if gt_user_signed_in?
      @gt_user = GtUser.find_by params[:id]
    else
      redirect_to new_gt_user_session_path
    end
  end
end
