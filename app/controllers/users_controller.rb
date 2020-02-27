class UsersController < ApplicationController
	access user: [:show, :index],  [:user_manager, :site_admin] => :all

	def index 
		@users = User.all
	end 

	def new
		@user = User.new
	end 

	def show 
		@user = User.find(params[:id])
	end 

	def edit 
		@user = User.find(params[:id])
	end 

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	      flash[:success] = "Your account was updated successfully"
	      redirect_to root_path
	    else
	      render 'edit'
	    end
  	end

	private 

	def user_params
    	params.require(:user).permit(:email, :password)
  	end
end
