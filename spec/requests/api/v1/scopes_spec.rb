require "rails_helper"

RSpec.describe "Api::V1::Scopes" do
  it_behaves_like "CRUD actions", :scope do
    let(:valid_attributes) do
      { name: "Scope text" }
    end
  end
end
