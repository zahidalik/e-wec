class Classroom < ApplicationRecord
  belongs_to :tutor
  belongs_to :standard
  belongs_to :subject

  has_many :lessons
  has_many :activities
  has_many :exams
end
