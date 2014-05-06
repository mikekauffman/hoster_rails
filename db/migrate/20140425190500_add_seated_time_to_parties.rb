class AddSeatedTimeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :seated_time, :datetime
  end
end
