FactoryGirl.define do

  factory :user do
    sequence :email do |n|
      "user#{n}@gmail.com"
    end
    
    trait :user1 do
      email "user1@gmail.com"
      password "1111"
    end
    
    trait :user2 do
      email "user2@gmail.com"
    end
    
  end
  
  factory :coupon do
    code Coupon.random_code

    trait :published_to_anonymous do
    end

    trait :published_to_user1 do
      association :user, :user1
    end

    trait :published_to_user2 do
      association :user, :user2
    end
    
    trait :discount_thirty_percent do
      discount_value 0.3
    end
    
    trait :discount_five_hundred_won_sale do
      discount_value 500
    end
    
    trait :no_discount do
      discount_value nil
    end
    
  end

  factory :letter do
    trait :letter_from_user1 do
      association :user, :user1
    end

    trait :letter_from_이원섭 do
      sender_name "이원섭"
    end
    
    trait :letter_from_anonymous do
      sender_name "아무개"
    end
  end
  
  factory :billing do
    association :letter, :letter_from_anonymous
    trait :billing_to_anonymous do
      
    end
    trait :default do
    end
  end
  
  factory :product do
    title "default_product"
    price 3400
    trait :discount_thirty_percent do
      discount_value 0.3
    end
    
    trait :discount_five_hundred_won_sale do
      discount_value 500
    end
    
    trait :no_discount do
      discount_value nil
    end
  end
  
end