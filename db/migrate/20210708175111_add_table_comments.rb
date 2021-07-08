class AddTableComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end

    add_foreign_key :comments, :products
    add_foreign_key :comments, :users
  end
end
