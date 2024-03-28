class Question < ApplicationRecord
  has_many :questionnaire_questions, dependent: :restrict_with_error
  has_many :questionnaires, through: :questionnaire_questions
  has_many :answers, dependent: :restrict_with_error

  validates :question_type, inclusion: ["open", "test"]
  validates :statement, presence: true

  def answers_number
    answers.count
  end
end
