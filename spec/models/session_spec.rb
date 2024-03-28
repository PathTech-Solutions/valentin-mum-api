require "rails_helper"

RSpec.describe Session, type: :model do
  answer = FactoryBot.create(:answer, score: 1)
  session = FactoryBot.create(:session) do |session_new|
    FactoryBot.create_list(:given_answer, 2, session: session_new, answer:)
    FactoryBot.create_list(:session_user, 2, session: session_new)
  end

  context "Should validate" do
    it "with questionnaire and scope present" do
      expect(session).to be_valid
    end
  end

  context "Given answers" do
    it "set is valid" do
      expect(session).to be_valid
      expect(session.given_answers.count).to eq(2)
    end
    it "not set is valid" do
      session.given_answers = []
      expect(session).to be_valid
      expect(session.given_answers.count).to eq(0)
    end
  end

  context "Session users" do
    it "set is valid" do
      expect(session).to be_valid
      expect(session.session_users.count).to eq(2)
    end
    it "not set is valid" do
      session.session_users = []
      expect(session).to be_valid
      expect(session.session_users.count).to eq(0)
    end
  end

  context "Should not validate" do
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
