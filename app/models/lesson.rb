class Lesson < ApplicationRecord
  belongs_to :standard
  has_rich_text :body

  validates :subject, :topic, :body, presence:true
end
