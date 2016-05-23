class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.int :user_id
      t.int :friend_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
