FactoryGirl.define do
  factory :purchase do
    u_name "fukunaga"
    purchase_num 5
    u_address "渋谷"
    u_phone_num "09012345678"
    u_email "test@gmail.com"

    trait :too_much do
      purchase_num 101
    end
    # factory :expensive_book, traits: [:very_expensive]
  end
end