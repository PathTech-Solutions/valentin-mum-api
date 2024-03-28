require "rails_helper"

RSpec.describe Question do
  let(:question) { build(:question) }
  let(:answer) { build(:answer, 1, question:) }

  context "when Should validate" do
    it "with statement, question_type and answer present" do
      expect(question).to be_valid
    end

    it "with statement and question_type present" do
      question.answers = []
      expect(question).to be_valid
    end
  end

  context "when Should not validate" do
    it "without statement" do
      question.statement = nil
      expect(question).not_to be_valid
    end

    it "without question_type" do
      question.question_type = nil
      expect(question).not_to be_valid
    end
  end

  context "when Question type" do
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

  context "when answers_number" do
    it "equals question answers list" do
      answers_number_hard = question.answers.count
      expect(question.answers_number).to eq(answers_number_hard)
    end
  end

  context "when Questionnaires" do
    it "has many" do
      expect(question).to respond_to(:questionnaires)
    end
  end
end
