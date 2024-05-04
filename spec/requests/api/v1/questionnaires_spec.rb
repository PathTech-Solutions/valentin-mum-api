require "rails_helper"

RSpec.describe "Api::V1::Questionnaires" do
  it_behaves_like "CRUD actions", :questionnaire do
    let(:category) { create(:category) }
    let(:valid_attributes) do
      { category_id: category.id }
    end
  end
end
