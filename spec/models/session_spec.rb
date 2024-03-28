require "rails_helper"

RSpec.describe Session do
  let(:session) { build(:session) }

  context "when Should validate" do
    it "with questionnaire and scope present" do
      expect(session).to be_valid
    end
  end

  context "when Given answers" do
    it "has many" do
      expect(session).to respond_to(:given_answers)
    end
  end

  context "when Session users" do
    it "has many" do
      expect(session).to respond_to(:session_users)
    end
  end

  context "when Should not validate" do
    it "without questionnaire" do
      session.questionnaire = nil
      expect(session).not_to be_valid
    end

    it "without scope" do
      session.scope = nil
      expect(session).not_to be_valid
    end
  end
end
