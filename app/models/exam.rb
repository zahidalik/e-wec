class Exam < ApplicationRecord
  belongs_to :classroom
  has_many :answers

  has_rich_text :exam
end
