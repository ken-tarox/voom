class CreateOnsenposts < ActiveRecord::Migration[6.0]
  def change
    create_table :onsenposts do |t|

      t.string :onsen_name
      t.string :address
      t.string :title
      t.text :content
      t.float :rate
      t.integer :kind
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
    add_index :onsenposts, [:user_id, :created_at]
  end
end
