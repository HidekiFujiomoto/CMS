class FollowUsersController < ApplicationController

  def create
    follow_user = current_user.follow_users_of_from_user.create(from_user_id: params[:from_user_id])
    redirect_to users_url, notice: "お気に入り登録しました"
  end

  def destroy
    follow_user = current_user.follow_users_of_from_user.find_by(from_user_id: params[:from_user_id]).destroy
    redirect_to users_url, notice: "お気に入り解除しました"
  end

end
