class ItemsController < ApplicationController
  before_action :require_ownership, only: [:edit, :update, :destroy]

  def index
    # index and search
    @q = Item.ransack(params[:q])
    @items = @q.result

    # top item
    a = 0
    @items = Item.all
    @items.each do |item|
      if item.people.length > a
        a = item.people.length 
       @top = item
      end
    end




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
    else 
      flash.now[:alert] = @item.errors.full_messages
      render :edit
    end
  end

  def show
    @key = Figaro.env.google_api_key 
    @item = Item.find(params[:id])
    @user = @item.user    

    if current_user && current_user.watch.include?(@item)
      @watch = "Remove Item From Watch List"
    elsif current_user && current_user.watch.include?(@item) == false
      @watch = "Add Item to Watch List"
    end

    @watchers = @item.people.length

  # ensuring when it says item has watcher/s the grammer is right
    if @watchers  == 1 
      @person = "Watcher"
    else
      @person = "Watchers"
    end

  end

  def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to root_path
  end

  def about 
  end

  def watch
    
    @item = Item.find(params[:id])
    if current_user && current_user.watch.include?(@item)
      current_user.watch.delete(@item)
    
    elsif current_user && current_user.watch.include?(@item) == false 
      current_user.watch << @item

    else 
      flash[:alert] = "You Are Not Signed in."
    end
    
    render: json @item.user.length
    # redirect_to "/items/#{@item.id}" 

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
