class Scope < ApplicationRecord
    has_many :sessions

    validates_presence_of :name
end
