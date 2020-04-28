class Subject < ApplicationRecord
  validates :name, presence: true
  has_many :standard_subjects
  has_many :standards, through: :standard_subjects
  has_many :tutor_subjects
  has_many :tutors, through: :tutor_subjects
  has_many :student_subjects
  has_many :students, through: :student_subjects
end
