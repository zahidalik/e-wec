class Subject < ApplicationRecord
  belongs_to :tutor
  belongs_to :standard

  validates :name, presence: true
end
