class AddOnsenInfoToOnsenposts < ActiveRecord::Migration[6.0]
  def change
    add_column :onsenposts, :kind_b, :integer
    add_column :onsenposts, :kind_c, :integer
    add_column :onsenposts, :kind_d, :integer
  end
end
