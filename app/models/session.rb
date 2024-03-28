class Session < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :scope
  has_many :given_answers, dependent: :restrict_with_error
  has_many :session_users, dependent: :restrict_with_error
end
