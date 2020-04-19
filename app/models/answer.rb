class Answer < ApplicationRecord
  belongs_to :student
  has_rich_text :answer

  validates :subject, :topic, :answer, presence: true
  default_scope { order(created_at: :desc) }
end
