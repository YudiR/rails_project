class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
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
    params.require(:item).permit(:image, :category, :title, :description, :price, user_id: current_user)  
  end

end
