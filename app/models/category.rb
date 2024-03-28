class Category < ApplicationRecord
  has_many :questionnaires, dependent: :restrict_with_error

  validates :name, presence: true
end
