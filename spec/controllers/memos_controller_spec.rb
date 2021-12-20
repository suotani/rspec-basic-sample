require 'rails_helper'


RSpec.describe MemosController, type: :controller do
  let(:user) { create(:user) }

  describe "#create" do
    it "responds with json formatted output" do
      new_memo = {title: "test"}
      sign_in user
      post :create, format: :json, params: {memo: new_memo}
      expect(response.content_type).to eq "application/json"
    end

    it "adds a new memo" do
      new_memo = {title: "test"}
      sign_in user
      expect {
        post :create, format: :json, params: {memo: new_memo}
      }.to change(Memo, :count).by(1)
    end

    it "require authentication" do
      new_memo = {title: "test"}
      expect {
        post :create, format: :json, params: {memo: new_memo}
      }.to_not change(Memo, :count)
      expect(response).to_not be_successful
    end
  end
end