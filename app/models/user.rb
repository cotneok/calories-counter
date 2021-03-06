class User < ApplicationRecord
  attr_accessor :show_todays_meals
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :user_manager], multiple: false)                            ##
  ############################################################################################ 
 

  has_many :meals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def show_todays_meals
    self.meals.where("date >= ?", DateTime.now.in_time_zone("Tbilisi").beginning_of_day)
  end
end
