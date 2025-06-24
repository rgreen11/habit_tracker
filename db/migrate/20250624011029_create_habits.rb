class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :habit, null: false, default: ""
      # "day", "week"
      t.string :frequency_unit, null: false, default: ""
      # e.g. "2" for every 2 days
      t.string :frequency_value, null: false, default: ""
      
      t.timestamps
    end
  end
end
