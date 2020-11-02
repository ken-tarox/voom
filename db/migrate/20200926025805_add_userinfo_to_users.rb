class AddUserinfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :picture, :string
    add_column :users, :content, :text
  end
end
