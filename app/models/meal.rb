class Meal < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates_presence_of :calories, numericality: {greater_than: 0}
  	validates_presence_of :date, :name

end
