require 'spec_helper'

describe Letter do
  it "를 생성. 익명으로." do
    letter = FactoryGirl.create(:letter, :letter_from_이원섭)
    letter.sender_name.should eq("이원섭")
  end

  it "가 생성되면 default_product와 연결된 billing도 생성" do
    letter = FactoryGirl.create(:letter, :letter_from_이원섭)
    letter.billing.sender_name.should eql("이원섭")
  end
  
  it "가 생성되면 default_product와 연결된 billing도 생성" do
    letter = FactoryGirl.create(:letter, :letter_from_이원섭)
    letter.billing.product.title.should eql("default_product")
  end
end
