require 'rails_helper'

RSpec.describe Category, type: :model do
  category = FactoryBot.create(:category) do |category|
      FactoryBot.create_list(:questionnaire, 2,category:category)
    end

  context 'Should validate' do
    it 'with name present' do
      expect(category).to be_valid
    end
  end

  context 'Questionnaires' do
    it 'not set is valid' do
      category.questionnaires = []
      expect(category).to be_valid
      expect(category.questionnaires.count).to eq(0)
    end
    it 'set is valid' do
      expect(category).to be_valid
      expect(category.questionnaires.count).to eq(2)
    end
  end

  context 'Should not validate' do
    it 'with name not present' do
      category.name = nil
      expect(category).not_to be_valid
    end
  end

end
