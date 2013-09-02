class Billing < ActiveRecord::Base
  has_one :letter
  belongs_to :product
  belongs_to :user
  accepts_nested_attributes_for :letter
  
  before_create :billing_has_default_product
  
  def activate_coupon(coupon)
    self.coupon = coupon
    self.save
  end
  
  private
    def create_or_find_default_product
      if Product.exists?(title: "default_product")
        Product.where(title: "default_product").first
      else
        Product.create(title: "default_product", price: 3400, discount_value: 0.1)
      end
    end
    
    def billing_has_default_product
      self.product = create_or_find_default_product
    end
  
end
