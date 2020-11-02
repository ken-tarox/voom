class AddMapInfoToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :latitude, :float
    add_column :onsenposts, :longitude, :float
  end
end
