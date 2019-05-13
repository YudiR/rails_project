class SearchesController < ApplicationController
  def new
    # @search = Search.new
    # @categories = Item.uniq.pluck(:category)
  end

  def create
    # @search = Search.create(search_params)
    # redirect_to @search
  end

  def show
    # @search = Search.find(params[:id])
  end

  def index
    @title = Item.where("title LIKE ? ", "%#{params[:title]}%")  
    #store all the clients that match the name searched    
    @clients = Item.where("category LIKE ? ", "%#{params[:category]}%")

    @item = Item.search(params[:title], params[:category]).all
  end

# private 
# 
# def search_params
  # params.require(:search).permit(:keywords, :category, :location, :min_price, :max_price)
# end
# 
end

