class Tutor < ApplicationRecord
  validates :name, :contact, presence: true

  has_secure_password
end
