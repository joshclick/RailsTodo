class Task < ActiveRecord::Base
  belongs_to :user

  validates :todo_text, presence: true, length: { maximum: 512 }

  self.per_page = 10
end
