class AddDayOfWeekToParties < ActiveRecord::Migration
  def change
    add_column :parties, :day_of_week, :string
  end
end
