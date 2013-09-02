require 'spec_helper'

describe Product do
  it "가 만들어진다. billing이 생성되면." do
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)    
    letter.billing.product.title.should eql("default_product")
  end
  
  it "가 30% 할인 가격일 때 billing에 적용" do
    product = FactoryGirl.create(:product, :discount_thirty_percent)
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)
    letter.billing.total_price.should eql(2380)

  end  
  it "가 500원 할인 가격일 때 billing에 적용" do
    product = FactoryGirl.create(:product, :discount_five_hundred_won_sale)
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)
    letter.billing.total_price.should eql(2900)
  end
  
  it "가 할인하지 않을 때 billing에 적용" do
    product = FactoryGirl.create(:product, :no_discount)
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)
    letter.billing.total_price.should eql(3400)
  end
end
