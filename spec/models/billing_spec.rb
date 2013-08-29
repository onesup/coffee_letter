require 'spec_helper'

describe Billing do
  it "이 만들어진다. letter가 생성되면." do
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)    
    letter.billing.should be
  end
  
  it "의 sender_name은 letter의 sender_name과 같다." do
    letter = FactoryGirl.create(:letter, :letter_from_이원섭)    
    letter.billing.sender_name.should eq("이원섭")
  end
  
  it "의 sender_name은 letter의 sender_name과 같다." do
    letter = FactoryGirl.create(:letter, :letter_from_anonymous)    
    letter.billing.sender_name.should eq("아무개")
  end
  
end
