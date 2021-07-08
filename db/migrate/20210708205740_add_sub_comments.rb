class AddSubComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_comments do |t|
      t.integer :comment_id
      t.string :sub_comment
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :sub_comments, :comments
  end
end
