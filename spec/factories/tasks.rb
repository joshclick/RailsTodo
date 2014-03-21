FactoryGirl.define do
  factory :task do
    todo_text Faker::Lorem.sentence(5)

    trait :long_text do
      todo_text Faker::Lorem.sentence(300)
    end
  end
end
