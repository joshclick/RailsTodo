class Task < ActiveRecord::Base
  attr_accessible :completed, :todo_text

  validates :todo_text, presence: true, length: { maximum: 512 }
end
