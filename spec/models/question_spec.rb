require "rails_helper"

RSpec.describe Question, type: :model do
  let(:question) { FactoryBot.build(:question) }
  let(:answer) { FactoryBot.build(:answer, 1, question:) }

  question_with_questionnaires = FactoryBot.create(:question) do |question|
    FactoryBot.create_list(:questionnaire, 2, questions: [question])
  end

  context "Should validate" do
    it "with statement, question_type and answer present" do
      expect(question).to be_valid
    end
    it "with statement and question_type present" do
      question.answers = []
      expect(question).to be_valid
    end
  end

  context "Should not validate" do
    it "without statement" do
      question.statement = nil
      expect(question).not_to be_valid
    end
    it "without question_type" do
      question.question_type = nil
      expect(question).not_to be_valid
    end
  end

  context "Question type" do
    it "different from open and test" do
      question.question_type = "this is a test"
      expect(question).not_to be_valid
    end
    it "equals to test" do
      question.question_type = "test"
      expect(question).to be_valid
    end
    it "equals to open" do
      question.question_type = "open"
      expect(question).to be_valid
    end
  end

  context "answers_number" do
    it "equals question answers list" do
      answers_number_hard = question.answers.count
      expect(question.answers_number).to eq(answers_number_hard)
    end
  end

  context "Questionnaires" do
    it "set is valid" do
      expect(question_with_questionnaires).to be_valid
      expect(question_with_questionnaires.questionnaires.count).to eq(2)
    end
    it "not set is valid" do
      question_with_questionnaires.questionnaires = []
      expect(question_with_questionnaires).to be_valid
      expect(question_with_questionnaires.questionnaires.count).to eq(0)
    end
  end
end
