class Billing < ActiveRecord::Base
  attr_accessible :amount, :approved_at, :letter_id, :sender_name, :status, :status_desc, :user_id
  belongs_to :letter
end
