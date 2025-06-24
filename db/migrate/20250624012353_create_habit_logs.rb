class CreateHabitLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_logs do |t|
      t.string :status, null: false, default: ""
      t.timestamps
    end
  end
end
