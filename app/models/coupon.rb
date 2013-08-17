class Coupon < ActiveRecord::Base
  belongs_to :user

  #published, used, new

  #주인이 있는 쿠폰입니다. 
  def can_use_for?(user)
    unless self.status == "used"
      result = TRUE
    else
      result = FALSE
    end

    if result and self.user == nil
      result = TRUE
    elsif User.exists?(self.user)
      if user == self.user
        result = TRUE
      else
        result = self.user.id
      end
    end
    result
  end
  
  def self.made_for(user)
    discount = 0.2
    if User.exists?(user)
      coupon = Coupon.create(:status => "published", :code => Coupon.random_code, :discount => discount)
      user.coupons << coupon
    else
      Coupon.create(:status => "new", :code => Coupon.random_code, :discount => discount)
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
