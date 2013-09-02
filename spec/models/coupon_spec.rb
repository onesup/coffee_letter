require 'spec_helper'

describe "Coupon" do
  it "이 user1에게 published 된 것이라면 user1만 사용가능" do
    coupon = FactoryGirl.create(:coupon, :published_to_user1)
    user1 = FactoryGirl.create(:user, :user1)
    coupon.can_use_for?(user1).should be_true
  end
  
  it "이 user1에게 published 된 것을 user2가 사용하면 user1의 id를 반환" do
    coupon = FactoryGirl.create(:coupon, :published_to_user1)
    user2 = FactoryGirl.build(:user, :user2)
    coupon.can_use_for?(user2).should be_kind_of Fixnum
  end
  
  it "이 user1에게 published 된 것을 user2가 사용하려는데, user1이 레코드에 없거나 탈퇴했으면 사용가능" do
    
  end
  
  it "의 코드가 발행되지 않은 것이라면 거부" do
    code = "coffee-letter-000000"
    Coupon.valid?(code).should be_false
  end

  it "이 무기명 발행된것이라면 사용승락" do
    coupon = FactoryGirl.create(:coupon, :published_to_anonymous)
    code = coupon.code
    Coupon.valid?(code).should be_true
  end
  
  it "의 코드가 user2에게 발행된 것을 user1이 사용하면 id를 반환" do
    coupon = FactoryGirl.create(:coupon, :published_to_user2)
    user1 = FactoryGirl.build(:user, :user1)
    Coupon.valid?(coupon.code, user1).should be_kind_of Fixnum
  end
  
  it "을 쓰게 되면 결제가격에 적용" do
    coupon = FactoryGirl.create(:coupon, :published_to_user1)
    billing = FactoryGirl.create(:billing, :default)
    coupon_activated_billing = billing.activate_coupon(coupon)
    coupon_activated_billing.total_price = 3400 - (3400 * 0.3)
  end
  
end
