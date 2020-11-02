class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.references :user,  foreign_key: true
      t.references :onsenpost,  foreign_key: true

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
