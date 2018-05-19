class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update]

  def index
    @q = User.ransack(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @users = @q.result(distinct: true)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
  end

  def top
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


  private
  def user_params
    params.require(:user).permit(:user_id,:user_name,:user_email,
      :user_address,:user_icon,:facebook,:twitter,:instagram,
      :professional,:skill,:hobby,:user_fb_msg,:password_digest,
      :password_digest_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
