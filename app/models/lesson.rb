class Lesson < ApplicationRecord
  belongs_to :standard
  has_rich_text :body
  has_one_attached :vedio
  
  validates :subject, :topic, :body, presence:true
end
