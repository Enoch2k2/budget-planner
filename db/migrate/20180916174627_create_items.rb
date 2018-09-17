class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :cost, default: 0.0
      t.belongs_to :budget, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
