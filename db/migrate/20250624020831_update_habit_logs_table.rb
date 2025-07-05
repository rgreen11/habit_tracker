class UpdateHabitLogsTable < ActiveRecord::Migration[7.1]
  def change
      add_reference :habit_logs, :habit, null: false, foreign_key: true

      add_column :habit_logs, :log_date, :date, null: false
      
      change_column_default :habit_logs, :status, from: "", to: "pending"

      # Prevent duplicate logs for the same habit + date
      add_index :habit_logs, [:habit_id, :log_date], unique: true
  end
end
