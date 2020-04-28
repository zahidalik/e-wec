class Subject < ApplicationRecord
  validates :name, presence: true
  has_many :standard_subjects
  has_many :standards, through: :standard_subjects
  has_many :tutors, through: :standard_subjects
end
