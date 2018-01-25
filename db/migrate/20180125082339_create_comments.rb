class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :username
      t.integer :commentable_id, limit: 8
      t.string :commentable_type

      t.timestamps
    end
  end
end
