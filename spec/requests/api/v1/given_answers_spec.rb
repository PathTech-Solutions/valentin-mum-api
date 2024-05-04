require "rails_helper"

RSpec.describe "Api::V1::GivenAnswers" do
  it_behaves_like "CRUD actions", :given_answer do
    let(:answer) { create(:answer) }
    let(:session) { create(:session) }
    let(:valid_attributes) do
      { text: "GivenAnswers text", answer_id: answer.id, session_id: session.id }
    end
  end
end
