class ItemsController < ApplicationController
  before_action :require_ownership, only: [:edit, :update, :destroy]
 

  def index
    # index and search
    @q = Item.ransack(params[:q])
    @items = @q.result

    # top item
    a = 0
    @itemz = Item.all
    @itemz.each do |item|
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
      redirect_to root_path
    else
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#{@item.errors.full_messages}"
      flash.now[:alert] = "<br/>#{@item.errors.full_messages}".html_safe
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
      flash.now[:alert] = "<br/>#{@item.errors.full_messages}".html_safe
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
    puts "watchers watchers watchers watchers watchers #{@watchers}"
  
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
    @watchers = @item.people.length
    if @watchers  == 1 
      @person = "Watcher"
    else
      @person = "Watchers"
    end

    
    if current_user && current_user.watch.include?(@item)
      current_user.watch.delete(@item)
    
    elsif current_user && current_user.watch.include?(@item) == false 
      current_user.watch << @item

    else 
      flash[:alert] = "<br/>You Are Not Signed in.".html_safe
    end
    
    # render json: @item.user.length
    # redirect_to "/items/#{@item.id}" 

    respond_to do |format|
      format.json do 
        puts ".............response format as json"
        render json: @item.people.length
      end


    end

  end


  def require_ownership
    @item = Item.find(params[:id])
    
    unless current_user == @item.user
      flash[:alert] = " <br/> You are not the user of this account".html_safe
      redirect_to root_path
    end
  end


private 
  def item_params
    params.require(:item).permit(:image, :remove_image, :category, :location, :title, :price_cents, :description, :search)  
  end

end
