class AddDateAttributesToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :date_due, :date
    add_column :items, :date_paid, :date
  end
end
