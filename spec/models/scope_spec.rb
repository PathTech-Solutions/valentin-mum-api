require "rails_helper"

RSpec.describe Scope do
  let(:scope) { build(:scope) }

  context "when Should validate" do
    it "with name present" do
      expect(scope).to be_valid
    end
  end

  context "when Sessions" do
    it "has many" do
      expect(scope).to respond_to(:sessions)
    end
  end

  context "when Should not validate" do
    it "without name" do
      scope.name = nil
      expect(scope).not_to be_valid
    end
  end
end
