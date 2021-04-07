require 'rails_helper'


RSpec.describe TodosController, type: :request do
  let(:user) { create(:user) }

  describe "#index" do
    context "auth sample" do
      before do
        sign_in user
      end
      it "response success" do
        get "/users"
        expect(response.status).to eq(200)
      end
    end
  end

end