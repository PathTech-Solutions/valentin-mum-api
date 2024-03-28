require "rails_helper"

RSpec.describe Category do
  let(:category) { build(:category) }

  context "when Should validate" do
    it "with name present" do
      expect(category).to be_valid
    end
  end

  context "when Questionnaires" do
    it "has many" do
      expect(category).to respond_to(:questionnaires)
    end
  end

  context "when Should not validate" do
    it "with name not present" do
      category.name = nil
      expect(category).not_to be_valid
    end
  end
end
