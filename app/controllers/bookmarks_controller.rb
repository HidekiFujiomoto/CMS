class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "#{bookmark.post.user.user_name}さんのブログをお気に入り登録しました"
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(post_id: params[:post_id]).destroy
    redirect_to posts_url, notice: "#{bookmark.post.user.user_name}さんのブログをお気に入り解除しました"
  end
  
end
