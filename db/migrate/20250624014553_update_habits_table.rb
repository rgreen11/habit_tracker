class UpdateHabitsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :habits, :habit, :name

    change_column_default :habits, :name, ""
    change_column_null :habits, :name, false

    remove_column :habits, :frequency_value
    add_column :habits, :frequency_value, :integer, null: false, default: 1

    change_column_default :habits, :frequency_unit, "day"
    change_column_null :habits, :frequency_unit, false

    add_column :habits, :description, :text
    add_column :habits, :start_date, :date
    add_column :habits, :archived, :boolean, default: false
    add_reference :habits, :user, null: false, foreign_key: true
  end
end
