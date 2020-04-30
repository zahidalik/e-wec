class Standard < ApplicationRecord
  has_many :standard_tutors
  has_many :tutors, through: :standard_tutors
  has_many :standard_students
  has_many :students, through: :standard_students
  has_many :subjects
  
  validates :name, presence: true
end
