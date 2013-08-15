class Billing < ActiveRecord::Base
  # attr_accessible :amount, :approved_at, :letter_id, :sender_name, :status, :status_desc, :user_id
  # attr_accessible :letters_attributes
  has_many :letters
  belongs_to :user
  accepts_nested_attributes_for :letters
end
