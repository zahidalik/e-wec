class Standard < ApplicationRecord
  has_many :classrooms
  has_many :tutors, through: :classrooms
  has_many :subjects, through: :classrooms
  has_many :standard_students
  has_many :students, through: :standard_students

  validates :name, presence: true
end
