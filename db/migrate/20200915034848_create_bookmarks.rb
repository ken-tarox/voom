class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user,  foreign_key: true
      t.references :onsenpost,  foreign_key: true
      t.timestamps
    end
  end
end
