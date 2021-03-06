class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update,:destroy]

  def index
    @q = User.ransack(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @users_result = @q.result(distinct: true)
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tops_path(current_user.id)
    else
      render "new"
    end
  end

  def show
    @follow_user = current_user.follow_users_of_from_user.find_by(from_user_id: @user.id)
  end

  def edit
  end

  def update
    @user.password_digest = current_user.password_digest
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice:"アカウントを削除しました！"
  end

  def list
    @users = User.all
  end


  private
  def user_params
    params.require(:user).permit(:user_id,:user_name,:user_email,
      :user_address,:user_icon,:facebook,:twitter,:instagram,
      :professional,:skill,:hobby,:user_fb_msg,:password,
      :password_confirmation,:favorite_user)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
