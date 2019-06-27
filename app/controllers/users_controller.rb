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
        flash.now[:alert] = @user.errors.full_messages
        render :edit
      end     
    end

    def items
    end

    def watching
    @user = current_user
    end
  
    def sign_out
      session[:user_id] = nil
      redirect_to root_path
    end
      
  end
  

