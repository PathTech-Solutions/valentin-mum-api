require "rails_helper"

RSpec.describe "Api::V1::SessionUsers" do
  it_behaves_like "CRUD actions", :session_user do
    let(:session) { create(:session) }
    let(:shared_session) { create(:session) }
    let(:valid_attributes) do
      { session_id: session.id, shared_session_id: shared_session.id }
    end
  end
end
