class StandardStudent < ApplicationRecord
  belongs_to :standard
  belongs_to :student
  belongs_to :tutor
end
