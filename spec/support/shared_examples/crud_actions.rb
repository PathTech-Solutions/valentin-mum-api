RSpec.shared_examples "CRUD actions" do |parameter|
  let(:model_class) { parameter.to_s.classify.constantize }
  let(:instance) { create(parameter) }
  let(:json_response) { JSON.parse(response.body) }
  let(:endpoint) { "/api/v1/#{parameter.to_s.pluralize}/" }

  describe "GET index" do
    it "returns a success response" do
      create_list(parameter, 3) # Creating multiple instances
      get endpoint
      expect(response).to have_http_status(:ok)
      expect(json_response.size).to eq(3)
    end
  end

  describe "GET show" do
    it "returns a success response" do
      get endpoint, params: { id: instance.id }
      expect(response).to have_http_status(:ok)
      expect(json_response.first["id"]).to eq(instance.id)
    end
  end

  describe "POST create" do
    it "creates a new resource" do
      expect do
        post endpoint, params: valid_attributes
      end.to change(model_class, :count).by(1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH update" do
    let!(:resource) { create(parameter) }

    it "updates the specified resource" do
      patch endpoint + resource.id, params: valid_attributes
      resource.reload
      expect(response).to have_http_status(:ok)
      expect(resource).to have_attributes(valid_attributes)
    end
  end

  describe "DELETE destroy" do
    let!(:resource) { create(parameter) }

    it "destroys the specified resource" do
      expect do
        delete endpoint + resource.id, params: { id: resource.id }
      end.to change(model_class, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end
end
