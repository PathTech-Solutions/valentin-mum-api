class Question < ApplicationRecord
    has_many :questionnaire_questions
    has_many :questionnaires, through: :questionnaire_questions
    has_many :answers

    validates :question_type, inclusion: ['open', 'test']


    def answers_number
        answers.count
    end
end
