class Billing < ActiveRecord::Base
  # attr_accessible :amount, :approved_at, :letter_id, :sender_name, :status, :status_desc, :user_id
  # attr_accessible :letters_attributes
  has_many :letters
  belongs_to :product
  belongs_to :user
  accepts_nested_attributes_for :letters
  
  before_create :create_or_find_default_product
  after_create :billing_has_default_product
  
  private
    def create_or_find_default_product
      if Product.count == 0 or Product.first.title == nil
        p = Product.create(title: "defalut_product", price: 3400, discount_value: 0.1)
      else
        p = Product.where(title: "default_product").first
      end
    end
    
    def billing_has_default_product
      
    end
  
end
