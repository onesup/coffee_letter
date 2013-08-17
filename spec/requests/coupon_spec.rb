require 'spec_helper'

describe "FirstTests" do
  it "user1에게 published 된 coupon은 user1만 can use" do
    user1 = FactoryGirl.build(:user, :user1)
    user2 = FactoryGirl.build(:user, :user2)
    coupon = FactoryGirl.create(:coupon, :published_to_user1)
    coupon.can_use_for?(user1).should be_true    
  end
  
  it "user1에게 published 된 coupon을 user2는 can't use" do
    user1 = FactoryGirl.build(:user, :user1)
    user2 = FactoryGirl.build(:user, :user2)
    coupon = FactoryGirl.create(:coupon, :published_to_user1)
    coupon.can_use_for?(user2).should be_false    
  end
  
end
