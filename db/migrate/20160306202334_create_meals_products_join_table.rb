class CreateMealsProductsJoinTable < ActiveRecord::Migration
  def change
    create_table :meals_products, id: false do |t|
      t.integer :meal_id
      t.integer :product_id      
    end
    add_index :meals_products, [:meal_id, :product_id]
  end
end
