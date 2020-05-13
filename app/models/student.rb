class Student < ApplicationRecord
  has_many :standard_students
  has_many :standards, through: :standard_students
  has_many :interactions

  validates :name, :contact, :gender, presence: true

  default_scope { order(name: :asc) }
  has_secure_password
end
