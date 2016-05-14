class CreateJoinTableMealProduct < ActiveRecord::Migration
  def change
    create_join_table :meals, :products do |t|
      # t.index [:meal_id, :product_id]
      # t.index [:product_id, :meal_id]
    end
  end
end
