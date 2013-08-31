class AddSenderPhoneAndSalePriceAndPriceToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :price, :integer
    add_column :billings, :sale_price, :integer
    add_column :billings, :sender_phone, :string
    add_column :billings, :coupon_id, :integer
  end
end
