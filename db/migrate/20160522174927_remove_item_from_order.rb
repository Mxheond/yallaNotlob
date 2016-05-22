class RemoveItemFromOrder < ActiveRecord::Migration
  def change
    remove_reference :orders, :item, index: true, foreign_key: true
  end
end
