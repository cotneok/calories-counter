class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :calories

      t.timestamps
    end
  end
end
