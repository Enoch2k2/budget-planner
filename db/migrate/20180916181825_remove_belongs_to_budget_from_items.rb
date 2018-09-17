class RemoveBelongsToBudgetFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :budget, foreign_key: true
  end
end
