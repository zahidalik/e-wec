class Interaction < ApplicationRecord
  belongs_to :lesson
  belongs_to :student

  has_rich_text :interaction
  has_one_attached :interaction_audio
  has_one_attached :interaction_file

  validates :topic, presence: true
end
