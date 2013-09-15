class RenameDiscountToCoupons < ActiveRecord::Migration
  def change
    rename_column :coupons, :discount, :discount_value
  end
end
