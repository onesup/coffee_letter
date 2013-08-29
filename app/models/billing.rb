class Billing < ActiveRecord::Base
  has_many :letters
  belongs_to :product
  belongs_to :user
  accepts_nested_attributes_for :letters
  
  # before_create :create_or_find_default_product
  before_create :billing_has_default_product
  
  private
    def create_or_find_default_product
      if Product.exists?(title: "default_product")
        p = Product.where(title: "default_product").first
      else
        p = Product.create(title: "default_product", price: 3400, discount_value: 0.1)
      end
      return p
    end
    
    def billing_has_default_product
      self.product = create_or_find_default_product
    end
  
end
