class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kcal_per_day, :int, default: '1800'
  end
end
