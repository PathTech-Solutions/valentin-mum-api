class GivenAnswer < ApplicationRecord
    belongs_to :answer
    belongs_to :session
end
