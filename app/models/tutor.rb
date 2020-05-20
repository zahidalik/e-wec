class Tutor < ApplicationRecord
  has_many :classrooms
  has_many :standards, through: :classrooms
  has_many :subjects, through: :classrooms

  validates :name, :contact, presence: true

  has_secure_password
end
