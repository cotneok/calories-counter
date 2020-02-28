class Meal < ApplicationRecord
	attr_accessor :time, :search
	belongs_to :user
	validates :user_id, presence: true

  def self.time_filter(meals,period1,period2)
    meals.reject { |meal| meal.date < period1 }.reject{|meal| meal.date >period2}
  end

  def self.admin_time_filter(meals,period1,period2)
    meals.reject { |meal| meal.date < period1 }.reject{|meal| meal.date >period2}
  end

  def self.search(meals,period1,period2)
    meals.reject { |meal| meal.date < period1}.reject { |meal| meal.date > period2}.reject { |meal| meal.date.hour > period2.hour}.reject { |meal| meal.date.hour < period1.hour}
  end
end
