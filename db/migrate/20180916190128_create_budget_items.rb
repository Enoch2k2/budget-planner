class CreateBudgetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_items do |t|
      t.belongs_to :budget, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
