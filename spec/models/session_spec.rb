require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:session) { FactoryBot.build(:session) }
  context 'Should validate' do
    it 'with questionnaire and scope present' do
      expect(session).to be_valid
    end
  end

  context 'Should not validate' do
    it 'without questionnaire' do
      session.questionnaire = nil
      expect(session).not_to be_valid
    end
    it 'without scope' do
      session.scope = nil
      expect(session).not_to be_valid
    end
  end
end
