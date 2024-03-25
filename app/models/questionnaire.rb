class Questionnaire < ApplicationRecord
    has_many :sessions
    has_many :questionnaire_questions
    has_many :questions, through: :questionnaire_questions
    belongs_to :category
end
