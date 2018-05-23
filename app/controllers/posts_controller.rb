class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit,:update,:destroy]


  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
      @post.post_user_name = current_user.user_name
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_image_1.retrieve_from_cache! params[:cache][:post_image_1]
    @post.post_image_2.retrieve_from_cache! params[:cache][:post_image_2]
    @post.post_image_3.retrieve_from_cache! params[:cache][:post_image_3]
    if @post.save
      redirect_to posts_path, notice:"新規投稿しました！"
    else
      render "new"
    end
  end

  def show
    @bookmark = current_user.bookmarks.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_user_name = current_user.user_name
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:post_id,:post_title, :post_content,
      :post_image_1, :post_image_2, :post_image_3, :post_user_name,
      :post_user_id,:post_image_1_cache,:post_image_2_cache,:post_image_3_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
