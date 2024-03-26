require 'rails_helper'

RSpec.describe Scope, type: :model do
  let(:scope) { FactoryBot.build(:scope) }
  context 'Should validate' do
    it 'with name present' do
      expect(scope).to be_valid
    end
  end

  context 'Should not validate' do
    it 'without name' do
      scope.name = nil
      expect(scope).not_to be_valid
    end
  end
end
