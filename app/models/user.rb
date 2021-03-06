class User < ActiveRecord::Base
  include TheRoleUserModel
  authenticates_with_sorcery!
  
  # attr_accessible :password, :password_confirmation, :crypted_password, :salt
  # attr_accessible :username, :email, :name, :phone
  validates :email, presence: true
  validates_confirmation_of :password
  # validates_uniqueness_of :email
  has_many :letters
  has_many :billings
  has_many :coupons
end
