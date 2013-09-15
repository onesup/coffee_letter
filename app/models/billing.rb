class Billing < ActiveRecord::Base
  has_one :letter
  belongs_to :coupon
  belongs_to :product
  belongs_to :user
  accepts_nested_attributes_for :letter
  
  before_create :billing_has_default_product
  
  def use_coupon_code(code)
    if self.user.nil?
      result = Coupon.valid?(code)
      if result == true
        coupon = Coupon.find_by(code: code)
        self.activate_coupon(coupon)
      end
    else
      result = Coupon.valid?(code, self.user)
      if result == true
        self.activate_coupon(coupon)
      elsif result.class == Integer
        
      end
    end
  end
  
  def use_coupon(coupon)
    
  end
  
  def activate_coupon(coupon)
    self.coupon = coupon
    discount_value = self.coupon.discount_value
    unless self.coupon.discount_value.nil?  
      if self.coupon.discount_value > 1.0
        self.sale_price = (self.sale_price - discount_value).to_i
      elsif self.coupon.discount_value <= 1.0
        self.sale_price = (self.sale_price - (discount_value * price)).to_i
      end
    end
    self.total_price = self.sale_price * self.amount
    self.coupon.status = "used"
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
