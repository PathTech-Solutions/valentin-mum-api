require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.build(:category) }

  context 'Should validate' do
    it 'with name present' do
      expect(category).to be_valid
    end
  end

  context 'Should not validate' do
    it 'with name not present' do
      category.name = nil
      expect(category).not_to be_valid
    end
  end
end
