class Standard < ApplicationRecord
  validates :name, presence: true
  has_many :standard_students
  has_many :students, through: :standard_students

  default_scope { order(created_at: :asc) }
end
