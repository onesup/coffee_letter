require 'spec_helper'

describe Product do
  it "가 만들어진다. billing이 생성되면." do
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)    
    letter.billing.product.should be
  end
  
  it "title은 default_product" do
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)    
    letter.billing.product.title.should eql("default_product")
  end
  
end
