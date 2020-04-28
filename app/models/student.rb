class Student < ApplicationRecord
  validates :name, :contact, :gender, presence: true
  has_many :standard_students
  has_many :standards, through: :standard_students
  has_many :standard_subjects
  has_many :subjects, through: :standard_subjects
  has_many :answers

  default_scope { order(name: :asc) }
  has_secure_password
end
