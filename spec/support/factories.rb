FactoryGirl.define do
  factory :race do
    address "15 Yemen St"
    city "Yemen"
    state "IL"
  end

  factory :user do
    first_name "Erin"
    last_name "Pintozzi"
    boat_number "V26"
    usts_number "12345"
    sequence(:email) { |n| "Email #{n}" }
    password "password"

    factory :admin do
      role 1
    end
  end


  factory :boat_class do
    sequence(:class_name) { |n| "Class Name #{n}" }
  end


end
