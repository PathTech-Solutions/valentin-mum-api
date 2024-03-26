FactoryBot.define do
    factory :given_answer do
        session
        answer
        text { 'Sample text' }
    end
end