class Subject < ApplicationRecord
  has_many :classrooms
  has_many :standards, through: :classrooms
  has_many :tutors, through: :classrooms

  validates :name, presence: true
end
