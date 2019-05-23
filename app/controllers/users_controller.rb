class UsersController < ApplicationController
      
    
    def new
      @user = User.new
      
    end
  
    def create
      @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
      )
      
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      
      else
        flash.now[:alert] = @user.errors.full_messages
        render :new
      end
    end
  
    def edit
      @user = current_user
      # User.find(params[:id])
    end
  
    def update
      @user = current_user 
       User.find(params[:id])
      
      if @user.update_attributes(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        redirect_to root_path
      else
        render :edit
      end      # @user = present user 
    end

    def items
      # @items = current_user.items 

       # render :items
      # @items= @user.items
    end
  
      
  end
  

