class Reply < ApplicationRecord
  belongs_to :activity
  belongs_to :student

  has_rich_text :reply
  has_one_attached :reply_audio
  has_one_attached :reply_file
end
