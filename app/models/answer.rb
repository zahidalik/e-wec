class Answer < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  has_rich_text :answer
end
