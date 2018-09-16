class AddMonthlyIncomeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :monthly_income, :float, default: 0.0
  end
end
