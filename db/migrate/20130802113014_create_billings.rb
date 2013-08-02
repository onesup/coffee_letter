class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :user_id
      t.integer :letter_id
      t.integer :amount
      t.datetime :approved_at
      t.string :status
      t.string :status_desc
      t.string :sender_name

      t.timestamps
    end
  end
end
