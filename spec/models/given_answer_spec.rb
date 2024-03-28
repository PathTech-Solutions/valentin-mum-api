require "rails_helper"

RSpec.describe GivenAnswer do
  let(:given_answer) { build(:given_answer) }

  context "when Should validate" do
    it "with session and answer present" do
      expect(given_answer).to be_valid
    end
  end

  context "when Should not validate" do
    it "without session" do
      given_answer.session = nil
      expect(given_answer).not_to be_valid
    end

    it "without answer" do
      given_answer.answer = nil
      expect(given_answer).not_to be_valid
    end
  end
end
