class AddCommoditiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :commodities, :integer, :default => 0
  end
end
