require 'spec_helper'

feature "user order" do
    
  scenario "User write down landing page's form and meet to next step" do
    
    user1 = FactoryGirl.create(:user, :user1)
    
    visit root_path
    fill_in "letter_sender_name", with: "이원섭"
    click_on "submit"
    Letter.last.sender_name.should eq("이원섭")
    Letter.last.billing.sender_name.should eq("이원섭")
    Letter.last.billing.product.title.should eq("default_product")
    expect(page).to have_text("2단계")
    click_on "submit"
    expect(page).to have_text("로그인")
    find(".login").fill_in "email", with: 'user1@gmail.com', :match => :prefer_exact
    find(".login").fill_in "password", with: '1111', :match => :prefer_exact
    find(".login").click_on "로그인", :match => :prefer_exact
    Billing.last.user.should be
    Billing.last.user.email.should eq("user1@gmail.com")
    # expect(page).to have_text("2단계")
  end
end