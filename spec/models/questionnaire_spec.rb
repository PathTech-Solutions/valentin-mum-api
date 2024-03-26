require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  let(:questionnaire) { FactoryBot.build(:questionnaire) }
  context 'Should validate' do
    it 'with category present' do
      expect(questionnaire).to be_valid
    end
  end

  context 'Should not validate' do
    it 'without category' do
      questionnaire.category = nil
      expect(questionnaire).not_to be_valid
    end
  end
end
