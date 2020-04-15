class Tutor < ApplicationRecord
  validates :name, :contact, presence: true

  default_scope { order(name: :asc) }
  has_secure_password
end
