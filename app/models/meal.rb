class Meal < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products

  def allKcal
    self.products.sum(:kcal)
  end
end
