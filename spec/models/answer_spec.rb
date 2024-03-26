require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:answer) { FactoryBot.build(:answer) }
  let(:question_with_answers) { FactoryBot.create(:question) do |question|
      FactoryBot.create_list(:answer, 2, question: question)
    end
  }
  
  let(:answer_question_3_answers) { FactoryBot.create(:answer, question: question_with_answers) }
  
  context 'Should validate' do
    it 'with score, text and question present' do
      answer.score=1
      expect(answer).to be_valid
    end
  end

  context 'Should not validate' do
    it 'with only score and question present' do
      answer.text = nil
      expect(answer).not_to be_valid
    end
    it 'with only text and question present' do
      answer.score = nil
      expect(answer).not_to be_valid
    end
    it 'with only text and score present' do
      answer.question = nil
      expect(answer).not_to be_valid
    end
  end

  context 'Score with question with 1 answer' do
    it 'with score greater than 1' do
      answer.score = 2
      expect(answer).not_to be_valid
    end
    it 'with score equals to 1' do
      answer.score = 1
      expect(answer).to be_valid
    end
    it 'with score lower than 1' do
      answer.score = -1
      expect(answer).not_to be_valid
    end
    it 'with score equal to 0' do
      answer.score = 0
      expect(answer).not_to be_valid
    end
  end

  context 'Score with question with 3 answers' do
    it 'answers number is 4' do
      expect(answer_question_3_answers.question.answers_number).to eq(3)
    end
    it 'with score greater than 4' do
      answer_question_3_answers.score = 5
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score equals to 1' do
      answer_question_3_answers.score = 1
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score equals to 3' do
      answer_question_3_answers.score = 3
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score between 1 and 3' do
      answer_question_3_answers.score = 2
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score lower than 1' do
      answer_question_3_answers.score = -1
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score equal to 0' do
      answer_question_3_answers.score = 0
      expect(answer_question_3_answers).not_to be_valid
    end
    it 'with score equal to 4' do
      answer_question_3_answers.score = 4
      expect(answer_question_3_answers).to be_valid
    end
  end

  
end
