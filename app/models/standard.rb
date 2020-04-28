class Standard < ApplicationRecord
  validates :name, presence: true
  has_many :standard_students
  has_many :students, through: :standard_students
  has_many :tutors, through: :standard_students
  has_many :lessons
  has_many :standard_subjects
  has_many :subjects, through: :standard_subjects

  default_scope { order(created_at: :asc) }
end
