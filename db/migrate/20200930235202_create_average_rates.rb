class CreateAverageRates < ActiveRecord::Migration[6.0]
  def change
    create_table :average_rates do |t|
      t.references :onsenpost, foreign_key: true
      t.float :average_rate
      t.timestamps
    end
    add_index :average_rates, [:onsenpost_id, :created_at]
  end
end
