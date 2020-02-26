class UsersController < ApplicationController
	def index 
		@user = User.new
	end 

	def show 
		@user = User.find(params[:id])
	end 

	private 

	def user_params
    	params.require(:user).permit(:email, :password)
  	end
end
