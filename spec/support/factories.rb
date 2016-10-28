FactoryGirl.define do
  factory :race do
    address "15 Yemen St"
    city "Yemen"
    state "IL"
    start_date '2017/07/25'
    end_date  '2017/07/27'
  end

  factory :user do
    sequence(:first_name) { |n| "Name #{n}"}
    sequence(:last_name) { |n| "Last Name #{n}"}
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
