class Category < ApplicationRecord
    has_many :items
    has_many :budgets, through: :items
end
