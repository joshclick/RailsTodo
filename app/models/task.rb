class Task < ActiveRecord::Base
  belongs_to :user

  version_fu

  validates :todo_text, presence: true, length: { maximum: 512 }

  self.per_page = 10
end
