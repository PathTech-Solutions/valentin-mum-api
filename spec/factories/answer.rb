FactoryBot.define do
  factory :answer do
    text { "Sample text" }
    question
    score { question.answers.length + 1 }
  end
end
