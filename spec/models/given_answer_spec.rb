require 'rails_helper'

RSpec.describe GivenAnswer, type: :model do
  let(:given_answer) { FactoryBot.build(:given_answer) }
  context 'Should validate' do
    it 'with session and answer present' do
      expect(given_answer).to be_valid
    end
  end

  context 'Should not validate' do
    it 'without session' do
      given_answer.session = nil
      expect(given_answer).not_to be_valid
    end
    it 'without answer' do
      given_answer.answer = nil
      expect(given_answer).not_to be_valid
    end
  end
end
