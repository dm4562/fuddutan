class GtUsersController < ApplicationController
  before_action :authenticate_gt_user!

  def show
    if gt_user_signed_in?
      @gt_user = GtUser.find_by params[:id]
    end
  end
end
