class UsersController < ApplicationController
  class UserController < ApplicationController
    before_action :require_ownership, only: [:edit, :update]
  
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
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
  
      if @user.update_attributes(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        redirect_to root_path
      else
        render :edit
      end
    end

    def items
      @user = current_user
      @items= @user.items
    end
  
    def require_owner
      @user = User.find(params[:id])
      
      unless current_user == @user.id
        flash[:alert] = "You are not the user of this account"
        redirect_to root_path
      end
    end
  
  end
  
end
