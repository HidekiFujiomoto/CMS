class SearchsController < ApplicationController
  def index
    @q = Search.ransack(params[:q])
    @searchs = @q.result(distinct: true)
  end

  def search
    @q = Search.search(search_params)
    @searchs = @q.result(distinct: true)
  end

  private
  def search_params
    params.require(:q).permit!
  end

end
