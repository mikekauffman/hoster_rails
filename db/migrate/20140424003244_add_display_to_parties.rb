class AddDisplayToParties < ActiveRecord::Migration
  def change
    add_column :parties, :display, :boolean, default: true
  end
end
