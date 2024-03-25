FactoryBot.define do
    factory :answer do
      text { 'Sample text' }
      sequence(:score)
      question
    end
end