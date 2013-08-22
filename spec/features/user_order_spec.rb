require 'spec_helper'

feature "user order" do
    
  scenario "User write down landing page's form and meet to next step" do
    
    user1 = FactoryGirl.create(:user, :user1)
    
    visit root_path
    fill_in "letter_sender_name", with: "이원섭"
    click_on "submit"
    find(".login").fill_in "email", with: 'user1@gmail.com', :match => :prefer_exact
    find(".login").fill_in "password", with: '1111', :match => :prefer_exact
    find(".login").click_on "로그인", :match => :prefer_exact
    puts"***"
    puts Billing.last.user.nil?
    puts"***"
    Billing.last.user.email.should eq("user1@gmail.com")
    # expect(page).to have_text("2단계")
  end
end