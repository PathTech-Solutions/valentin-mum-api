require "rails_helper"

RSpec.describe QuestionnaireQuestion, type: :model do
  let(:questionnaire_question) { FactoryBot.build(:questionnaire_question) }

  context "Should validate" do
    it "with question and questionnaire present" do
      expect(questionnaire_question).to be_valid
    end
  end

  context "Should not validate" do
    it "without question present" do
      questionnaire_question.question = nil
      expect(questionnaire_question).not_to be_valid
    end
    it "without questionnaire present" do
      questionnaire_question.questionnaire = nil
      expect(questionnaire_question).not_to be_valid
    end
    it "without question nor questionnaire present" do
      questionnaire_question.question = nil
      questionnaire_question.questionnaire = nil
      expect(questionnaire_question).not_to be_valid
    end
  end
end
