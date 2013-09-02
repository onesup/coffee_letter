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
        Product.where(title: "default_product").last
      else
        Product.create(title: "default_product", price: 3400, discount_value: 0.1)
      end
    end
    
    def billing_has_default_product
      self.product = create_or_find_default_product
      price = self.product.price
      discount_value = self.product.discount_value
      
      self.amount = 1
      self.price = price
      unless self.product.discount_value.nil?  
        if self.product.discount_value > 1.0
          self.sale_price = (price - discount_value).to_i
        elsif self.product.discount_value <= 1.0
          self.sale_price = (price - (discount_value * price)).to_i
        end
      else
        self.sale_price = price
      end
      self.total_price = self.sale_price * self.amount
    end
  
end
