class Student < ApplicationRecord
  validates :name, :contact, :gender, presence: true

  has_secure_password
end
