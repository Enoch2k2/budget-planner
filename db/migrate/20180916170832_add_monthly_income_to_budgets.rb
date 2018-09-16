class AddMonthlyIncomeToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :monthly_income, :float, default: 0.0
  end
end
