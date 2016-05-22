class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :owner
      t.timestamps null: false

    end
  end
end
