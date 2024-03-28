require "rails_helper"

RSpec.describe SessionUser, type: :model do
  let(:session_user) { FactoryBot.build(:session_user) }
  let(:session) { FactoryBot.build(:session) }
  context "Should validate" do
    it "with session present" do
      expect(session_user).to be_valid
    end
    it "without session and shared_session present" do
      session_user.shared_session = session
      expect(session_user).to be_valid
    end
  end

  context "Should not validate" do
    it "without session" do
      session_user.session = nil
      expect(session_user).not_to be_valid
    end
    it "without session and with shared_session present" do
      session_user.session = nil
      session_user.shared_session = session
      expect(session_user).not_to be_valid
    end
  end
end
