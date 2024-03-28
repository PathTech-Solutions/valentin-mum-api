class Questionnaire < ApplicationRecord
  has_many :sessions, dependent: :restrict_with_error
  has_many :questionnaire_questions, dependent: :restrict_with_error
  has_many :questions, through: :questionnaire_questions
  belongs_to :category
end
