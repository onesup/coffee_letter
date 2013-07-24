class Letter < ActiveRecord::Base
  attr_accessible :content, :crypted_password, :email, :express, :paper_id, :receiver_name, :receiver_address, :receiver_phone, :receiver_phone, :salt, :sender_address, :sender_name, :sender_phone, :user_id
end
