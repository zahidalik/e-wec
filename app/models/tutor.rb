class Tutor < ApplicationRecord
  has_many :standard_tutors
  has_many :standards, through: :standard_tutors
  has_many :tutor_subjects
  has_many :subjects, through: :tutor_subjects
  validates :name, :contact, presence: true

  default_scope { order(name: :asc) }
  has_secure_password
end
