class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, default: 'Sample user'
    add_column :users, :date_of_birth, :datetime, default: Time.now
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :weight, :int, default: '50'
    add_column :users, :height, :int, default: '174'
  end
end
