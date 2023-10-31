class CreateOrderUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :users do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
    end
  end
end
