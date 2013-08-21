class AddProductIdToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :product_id, :integer
  end
end
