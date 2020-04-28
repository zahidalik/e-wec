class Tutor < ApplicationRecord
  has_many :standard_students
  has_many :standards, through: :standard_students
  has_many :standard_subjects
  has_many :subjects, through: :standard_subjects
  validates :name, :contact, presence: true

  default_scope { order(name: :asc) }
  has_secure_password
end
