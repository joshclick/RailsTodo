require 'ffaker'

FactoryGirl.define do
  factory :task do
    todo_text Faker::Lorem.sentence(5)
  end

  factory :task_todo_text_long, class: Task do
    todo_text Faker::Lorem.sentence(300)
  end
end
