class Scope < ApplicationRecord
  has_many :sessions, dependent: :restrict_with_error

  validates :name, presence: true
end
