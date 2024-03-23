class Answer < ApplicationRecord
    belongs_to :question
    has_many :given_answers
end
