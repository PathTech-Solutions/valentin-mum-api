class Session < ApplicationRecord
    belongs_to :questionnaire
    belongs_to :scope
    has_many :given_answers
    has_many :session_users

    validates_presence_of :questionnaire, :scope
end
