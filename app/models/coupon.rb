class Coupon < ActiveRecord::Base
  belongs_to :user
  has_one :billing
  #published, used, new

  #쿠폰 사용 약관에 "회원 탈퇴 시 쿠폰또한 삭제됩니다. 라고 명시해야함."
  def self.valid?(code, user=nil)
    if self.exists?(:code => code)
      coupons = self.where(:code => code)
      coupon = coupons.first
      if coupon.user.nil? and coupon.status != "used"
        result = true
      elsif coupon.user.nil? and coupon.status == "used"
        result = false
      elsif coupon.user.class == User and coupon.status != "used"
        result = coupon.can_use_for?(user)
      end
    end
    result
  end
  
  def can_use_for?(user)
    if self.status != "used" && self.user.email == user.email
      result = true
    elsif self.status != "used" && self.user.email != user.email
      result = self.user.id
    elsif self.status == "used"
      result = false
    end    
    result
  end
  
  def self.made_for(user)
    discount = 0.2
    if User.exists?(user)
      coupon = Coupon.create(:status => "published", :code => Coupon.random_code, :discount_value => discount)
      user.coupons << coupon
    else
      Coupon.create(:status => "new", :code => Coupon.random_code, :discount_value => discount)
    end
  end

  def self.random_code
    coffee = %w(c o f f e e) * 2
    letter = %w(l e t t e r) * 2
    digit = %w(2 4 6 7 8 9) * 2
    code = "c" + coffee.shuffle.join[0..5] + "e-l" + letter.shuffle.join[0..5] + "r-" + digit.shuffle.join[0..5]
    code
  end
  

  #for test  
  def self.list
    list = Array.new
    10000.times do
      list << Coupon.random_code
    end
    n = list.group_by(&:capitalize).map {|k,v| v.length}
    n.sort
  end
end
