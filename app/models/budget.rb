class Budget < ApplicationRecord
  belongs_to :user
  has_many :budget_items
  has_many :items, through: :budget_items
  has_many :categories, through: :items

  validates :title, presence: true

  def entertainment
    self.items.select{|item| item if item.category.name == "Entertainment"}
  end

  def entertainment_total
    total = 0
    self.entertainment.each{|e| total += e.cost}
    total.round(2)
  end

  def bills
    self.items.select{|item| item if item.category.name == "Bill"}
  end

  def bills_total
    total = 0
    self.bills.each{|b| total += b.cost}
    total.round(2)
  end

  def groceries
    self.items.select{|item| item if item.category.name == "Grocery"}
  end

  def groceries_total
    total = 0
    self.groceries.each{|g| total += g.cost}
    total.round(2)
  end

  def restaurants
    self.items.select{|item| item if item.category.name == "Restaurant"}
  end

  def restaurants_total
    total = 0
    self.restaurants.each{|r| total += r.cost}
    total.round(2)
  end
  
  def medical
    self.items.select{|item| item if item.category.name == "Medical"}
  end
  
  def medical_total
    total = 0
    self.medical.each{|m| total += m.cost}
    total.round(2)
  end

  def misc
    self.items.select{|item| item if item.category.name == "Misc"}
  end

  def misc_total
    total = 0
    self.misc.each{|m| total += m.cost}
    total.round(2)
  end

  def savings
    self.items.select{|item| item if item.category.name == "Savings"}
  end

  def savings_total
    total = 0
    self.savings.each{|s| total += s.cost}
    total.round(2)
  end

  def expense_total
    bills_total + entertainment_total + restaurants_total + misc_total + savings_total + groceries_total + medical_total
  end

  def income_remaining
    monthly_income.round(2) - expense_total.round(2)
  end
end
