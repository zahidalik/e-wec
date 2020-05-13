class Lesson < ApplicationRecord
  belongs_to :classroom

  has_one_attached :video
  has_one_attached :audio
  has_rich_text :lesson
  has_one_attached :file
  has_many :interactions

  validates :topic, :lesson, presence: true
end
