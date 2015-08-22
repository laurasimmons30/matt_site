class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :post_id, null: false
      t.integer :comment_id
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
