class AddImagesToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :images, :json
  end
end
