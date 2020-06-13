class Activity < ApplicationRecord
  belongs_to :classroom
  has_many :replies

  has_one_attached :activity_video
  has_one_attached :activity_audio
  has_rich_text :activity
  has_one_attached :activity_file
  
  validates :topic, presence: true
end
