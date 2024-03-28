require "rails_helper"

RSpec.describe Scope, type: :model do
  scope = FactoryBot.create(:scope) do |scope_new|
    FactoryBot.create_list(:session, 2, scope: scope_new)
  end
  context "Should validate" do
    it "with name present" do
      expect(scope).to be_valid
    end
  end

  context "Sessions" do
    it "set is valid" do
      expect(scope).to be_valid
      expect(scope.sessions.count).to eq(2)
    end
    it "not set is valid" do
      scope.sessions = []
      expect(scope).to be_valid
      expect(scope.sessions.count).to eq(0)
    end
  end

  context "Should not validate" do
    it "without name" do
      scope.name = nil
      expect(scope).not_to be_valid
    end
  end
end
