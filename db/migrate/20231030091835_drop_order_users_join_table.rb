class DropOrderUsersJoinTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :orders_users
  end

  def down
    create_join_table :orders, :users do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
    end
  end
end
