class AddPictureToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :picture, :string
  end
end
