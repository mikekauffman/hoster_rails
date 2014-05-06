class AddQuotedWaitTimeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :quoted_wait_time, :string
  end
end
