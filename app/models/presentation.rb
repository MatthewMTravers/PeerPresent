class Presentation < ApplicationRecord
    belongs_to :student
    has_many :evaluations
end
