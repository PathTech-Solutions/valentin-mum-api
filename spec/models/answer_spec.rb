require "rails_helper"

RSpec.describe Answer do
  let(:answer) { build(:answer, score: 1) }

  context "when Should validate" do
    it "with score, text and question present" do
      expect(answer).to be_valid
    end
  end

  context "when Should not validate" do
    it "with only score and question present" do
      answer.text = nil
      expect(answer).not_to be_valid
    end

    it "with only text and question present" do
      answer.score = nil
      expect(answer).not_to be_valid
    end

    it "with only text and score present" do
      answer.question = nil
      expect(answer).not_to be_valid
    end
  end

  context "when Score with question with 1 answer" do
    it "with score greater than 1" do
      answer.score = 2
      expect(answer).not_to be_valid
    end

    it "with score equals to 1" do
      answer.score = 1
      expect(answer).to be_valid
    end

    it "with score lower than 1" do
      answer.score = -1
      expect(answer).not_to be_valid
    end

    it "with score equal to 0" do
      answer.score = 0
      expect(answer).not_to be_valid
    end
  end

  context "with Given answers" do
    it "has many" do
      expect(answer).to respond_to(:given_answers)
    end
  end
end
