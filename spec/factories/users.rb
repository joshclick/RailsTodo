FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password 'password'

    trait :secondary do
      email Faker::Internet.email
    end
  end
end
