class AddAverageRateToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :average_rate, :float
  end
end
