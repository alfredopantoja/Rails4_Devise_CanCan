FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobaris"
    password_confirmation "foobaris"

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end  
  end
end  
