class SessionsController < ApplicationController

  def index
    render :layout => "second_layout"
  end

  def new
    render :layout => "second_layout"
  end

  def create
    user = User.find_by(user_email: params[:session][:user_email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tops_path
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice]='ログアウトしました'
    redirect_to new_session_path
  end


end
