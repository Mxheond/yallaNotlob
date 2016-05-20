class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :amount
      t.integer :price
      t.text :comment

      t.timestamps null: false
    end
  end
end
