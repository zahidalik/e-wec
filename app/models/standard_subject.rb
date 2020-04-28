class StandardSubject < ApplicationRecord
  belongs_to :standard
  belongs_to :subject
  belongs_to :tutor
  belongs_to :student
end
