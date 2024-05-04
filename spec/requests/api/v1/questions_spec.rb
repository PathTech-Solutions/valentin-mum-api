require "rails_helper"

RSpec.describe "Api::V1::Questions" do
  it_behaves_like "CRUD actions", :question do
    let(:valid_attributes) do
      { statement: "Question statement", question_type: "open" }
    end
  end
end
