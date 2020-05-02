class Subject < ApplicationRecord
  belongs_to :tutor
  belongs_to :standard

  validates :name, presence: true
  default_scope { order(name: :asc) }
end
