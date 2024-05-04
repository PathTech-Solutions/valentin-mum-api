require "rails_helper"

RSpec.describe "Api::V1::Sessions" do
  it_behaves_like "CRUD actions", :session do
    let(:questionnaire) { create(:questionnaire) }
    let(:scope) { create(:scope) }
    let(:valid_attributes) do
      { questionnaire_id: questionnaire.id, scope_id: scope.id }
    end
  end
end
