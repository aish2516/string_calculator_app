require 'rails_helper'


RSpec.describe CalculatorsController, type: :controller do
  describe "POST #calculate" do
    it "calculates the sum and renders result" do
      post :calculate, params: { numbers: "1,2,3" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["result"]).to eq(6)
    end

    it "handles newlines in input" do
      post :calculate, params: { numbers: "1\n2,3" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["result"]).to eq(6)
    end

    it "handles custom delimiters in input" do
      post :calculate, params: { numbers: "//;\n1;2;3" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["result"]).to eq(6)
    end

    it "handles negative numbers and renders error" do
      post :calculate, params: { numbers: "1,-2,3" }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)["error"]).to eq("Negative numbers are not allowed")
    end

    it "handles empty input and returns 0" do
      post :calculate, params: { numbers: "" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["result"]).to eq(0)
    end
  end
end
