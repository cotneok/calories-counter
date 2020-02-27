class UsersController < ApplicationController
	access user: [:show, :index],  [:user_manager, :site_admin] => :all

	def index 
		@users = User.all
	end 

	def show 
		@user = User.find(params[:id])
	end 

	private 

	def user_params
    	params.require(:user).permit(:email, :password)
  	end
end
