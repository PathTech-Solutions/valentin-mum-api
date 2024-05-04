require "rails_helper"

RSpec.describe "Api::V1::Answers" do
  # let(:question) { build(:question) }

  it_behaves_like "CRUD actions", :answer do
    let(:question) { create(:question) }
    let(:valid_attributes) do
      { text: "Answer text", question_id: question.id, score: 1 }
    end
  end
end
