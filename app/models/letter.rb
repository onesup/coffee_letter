class Letter < ActiveRecord::Base
  has_many :billings
  attr_accessible :content, :crypted_password, :email, :express, :paper_id, :salt, :user_id
  attr_accessible :receiver_name, :receiver_address, :receiver_phone, :receiver_phone
  attr_accessible :sender_address, :sender_name, :sender_phone, :controller_name
  attr_accessible :billings_attributes
  attr_accessor :controller_name
  
  accepts_nested_attributes_for :billings
end
