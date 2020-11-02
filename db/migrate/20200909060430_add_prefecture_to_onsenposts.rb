class AddPrefectureToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :prefecture, :integer
  end
end
