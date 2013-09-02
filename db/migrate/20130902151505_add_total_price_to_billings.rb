class AddTotalPriceToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :total_price, :integer
  end
end
