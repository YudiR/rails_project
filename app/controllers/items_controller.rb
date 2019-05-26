class ItemsController < ApplicationController
  before_action :require_ownership, only: [:edit, :update, :destroy]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash.now[:alert] = @item.errors.full_messages
      redirect_to root_path
    else
      flash.now[:alert] = @item.errors.full_messages

      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to "/items/#{@item.id}"
    end
  end

  def show
    @key = Figaro.env.google_api_key 
        #  ENV["google_api_key"] 

    @item = Item.find(params[:id])
    @user = @item.user
    render :show

  


    
  end

  def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to root_path
  end

  def about 
  end

  def require_ownership
    @item = Item.find(params[:id])
    
    unless current_user == @item.user
      flash[:alert] = "You are not the user of this account"
      redirect_to root_path
    end
  end


private 
  def item_params
    params.require(:item).permit(:image, :remove_image, :category, :location, :title, :price_cents, :description, :search)  
  end

end
