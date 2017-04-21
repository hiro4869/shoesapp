FactoryGirl.define do
  factory :purchase do
    u_name "fukunaga"
    purchase_num 5
    u_address "渋谷"
    u_phone_num "09012345678"
    u_email "test@gmail.com"

    trait :name_is_nil do
      u_name ""
    end

    trait :purchase_num_is_nil do
      purchase_num ""
    end

    trait :address_is_nil do
      u_address ""
    end

    trait :phone_num_is_nil do
      u_phone_num ""
    end

    trait :email_is_nil do
      u_email ""
    end

    trait :purchase_num_is_not_integer do
      purchase_num 1.5
    end

    trait :purchase_num_is_0 do
      purchase_num 0
    end

    trait :purchase_num_is_too_many do
      purchase_num 101
    end

    trait :phone_num_include_hyphen do
      u_phone_num "090-1234-5678"
    end

    trait :phone_num_include_Em do
      u_phone_num "０９０１２３４５６７８"
    end

    trait :phone_num_include_notnum_first do
      u_phone_num "あ09012345678"
    end

    trait :phone_num_include_notnum_last do
      u_phone_num "09012345678あ"
    end

    trait :phone_num_include_notnum_inside do
      u_phone_num "090あ12345678"
    end

    trait :phone_num_include_newline do
      u_phone_num "0901
        2345678"
    end

    trait :email_does_not_have_at do
      u_email "testgmail.com"
    end

    trait :email_is_nil_before_at do
      u_email "@gmail.com"
    end

    trait :email_is_nil_after_at do
      u_email "test@"
    end

    trait :email_include_Em_first do
      u_email "あtest@gmail.com"
    end

    trait :email_include_Em_last do
      u_email "test@gmail.comあ"
    end

    trait :email_include_Em_inside do
      u_email "testあ@gmail.com"
    end

    trait :email_include_newline do
      u_email "test@
        gmail.com"
    end
  end
end