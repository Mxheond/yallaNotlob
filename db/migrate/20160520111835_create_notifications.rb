class CreateNotifications < ActiveRecord::Migration
	
  def change
    create_table :notifications do |t|

      t.references :from, index: true, foreign_key: true
      t.references :to, index: true, foreign_key: true
      t.references :order_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
