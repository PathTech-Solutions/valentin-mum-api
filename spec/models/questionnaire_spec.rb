require 'rails_helper'

RSpec.describe Questionnaire, type: :model do
  questionnaire = FactoryBot.create(:questionnaire) do |questionnaire|
    FactoryBot.create_list(:session, 2, questionnaire: questionnaire)
    FactoryBot.create_list(:question, 2, questionnaires: [questionnaire])
  end
  context 'Should validate' do
    it 'with category present' do
      expect(questionnaire).to be_valid
    end
  end
  
  context 'Sessions' do
    it 'set is valid' do
      expect(questionnaire).to be_valid
      expect(questionnaire.sessions.count).to eq(2)
    end
    it 'not set is valid' do
      questionnaire.sessions = []
      expect(questionnaire).to be_valid
      expect(questionnaire.sessions.count).to eq(0)
    end
  end
  
  context 'Questions' do
    it 'set is valid' do
      expect(questionnaire).to be_valid
      expect(questionnaire.questions.count).to eq(2)
    end
    it 'not set is valid' do
      questionnaire.questions = []
      expect(questionnaire).to be_valid
      expect(questionnaire.questions.count).to eq(0)
    end
  end
  
    context 'Should not validate' do
      it 'without category' do
        questionnaire.category = nil
        expect(questionnaire).not_to be_valid
      end
    end
  
end
