require 'spec_helper'

describe Letter do
  it "를 생성. 익명으로." do
    letter = FactoryGirl.create(:letter, :letter_from_이원섭)
    letter.sender_name.should eq("이원섭")
  end
end
