class Task < ActiveRecord::Base
  validates :todo_text, presence: true, length: { maximum: 512 }
end
