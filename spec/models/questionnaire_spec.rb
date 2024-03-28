require "rails_helper"

RSpec.describe Questionnaire do
  let(:questionnaire) { build(:questionnaire) }

  context "when Should validate" do
    it "with category present" do
      expect(questionnaire).to be_valid
    end
  end

  context "when Sessions" do
    it "has many" do
      expect(questionnaire).to respond_to(:sessions)
    end
  end

  context "when Questions" do
    it "has many" do
      expect(questionnaire).to respond_to(:questions)
    end
  end

  context "when Should not validate" do
    it "without category" do
      questionnaire.category = nil
      expect(questionnaire).not_to be_valid
    end
  end
end
