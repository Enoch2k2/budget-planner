class Item < ApplicationRecord
  has_many :budget_items
  has_many :budgets, through: :budget_items
  belongs_to :category
end
