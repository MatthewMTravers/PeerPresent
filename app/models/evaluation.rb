class Evaluation < ApplicationRecord
  belongs_to :student
  belongs_to :presentation

  # Any validations needed, is a score or anything going to be required?, commented off for now
  validates :score, presence: true, numericality: { only_float: true }
end
