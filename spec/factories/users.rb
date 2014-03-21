FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'password'

    trait :secondary do
      email Faker::Internet.email
    end
  end
end
