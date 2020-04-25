class Lesson < ApplicationRecord
  belongs_to :standard
  has_rich_text :body
  has_one_attached :video
  has_one_attached :audio

  validates :subject, :topic, :body, presence:true
  default_scope { order(created_at: :desc) }
end
