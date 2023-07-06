class Recipe < ApplicationRecord
  belongs_to :user
  

  validates :name, presence: true, length: { in: 1..18 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { in: 1..450 }
end
