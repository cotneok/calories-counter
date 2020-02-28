class ChangeDateFormatInMeals < ActiveRecord::Migration[5.2]
  def change
  	change_column :meals, :date, :datetime 
  end
end
