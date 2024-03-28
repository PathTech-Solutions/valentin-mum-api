class Answer < ApplicationRecord
  belongs_to :question
  has_many :given_answers, dependent: :restrict_with_error

  validates :text, presence: true

  validate :score_within_range

  private

  def score_within_range
    if question.nil?
      errors.add(:score, "question must be set")
      return
    end
    max_number = question.answers_number + 1
    return if score == max_number

    errors.add(:score, "score must be #{max_number}")
  end
end
