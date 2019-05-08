class ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)

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

private 
  def item_params
    params.require(:item).permit(:image, :category, :location, :title, :description, :price, user: current_user)  
  end

end
