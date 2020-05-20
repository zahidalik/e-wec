class Student < ApplicationRecord
  has_many :standard_students
  has_many :standards, through: :standard_students
  has_many :interactions
  has_many :replies
  has_many :answers

  validates :name, :contact, :gender, presence: true

  has_secure_password
end
