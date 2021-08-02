class Todo < ApplicationRecord

  validates :text, presence: true, length: {maximum: 20}
  validates :priority, presence: true, inclusion: (1..5)

  belongs_to :user
end
