FactoryBot.define do
    factory :question do
        statement { 'Sample text' }
        question_type { 'open' }
        # answer
    end
end