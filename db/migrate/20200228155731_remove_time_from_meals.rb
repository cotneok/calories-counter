class RemoveTimeFromMeals < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :time, :time
  end
end
