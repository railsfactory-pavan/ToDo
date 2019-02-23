class ToDoList < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 120 }
  validates :description, length: { minimum: 160 }
end
