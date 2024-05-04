require "rails_helper"

RSpec.describe "Api::V1::Categories" do
  it_behaves_like "CRUD actions", :category do
    let(:valid_attributes) do
      { name: "Category text" }
    end
  end
end
