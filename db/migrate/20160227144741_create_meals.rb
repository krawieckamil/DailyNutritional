class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.datetime :date
      t.references :user, index: true, foreign_key: true
    end
  end
end
