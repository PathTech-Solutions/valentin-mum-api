class Category < ApplicationRecord
    has_many :questionnaires

    validates_presence_of :name
end
