FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'password'

    trait :secondary do
      email Faker::Internet.email
    end

    trait :admin do
      admin true
    end
  end
end
