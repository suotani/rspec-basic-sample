 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/memos", type: :request do
  
  # Memo. As you add validations to Memo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "aaa"}
  }

  let(:invalid_attributes) {
    {title: ""}
  }
  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      Memo.create! valid_attributes
      get memos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      memo = Memo.create! valid_attributes
      get memo_url(memo)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_memo_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      memo = Memo.create! valid_attributes
      get edit_memo_url(memo)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Memo" do
        expect {
          post memos_url, params: { memo: valid_attributes }
        }.to change(Memo, :count).by(1)
      end

      it "redirects to the created memo" do
        post memos_url, params: { memo: valid_attributes }
        expect(response).to redirect_to(memo_url(Memo.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Memo" do
        expect {
          post memos_url, params: { memo: invalid_attributes }
        }.to change(Memo, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post memos_url, params: { memo: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {title: "bbb"}
      }

      it "updates the requested memo" do
        memo = Memo.create! valid_attributes
        patch memo_url(memo), params: { memo: new_attributes }
        memo.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the memo" do
        memo = Memo.create! valid_attributes
        patch memo_url(memo), params: { memo: new_attributes }
        memo.reload
        expect(response).to redirect_to(memo_url(memo))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        memo = Memo.create! valid_attributes
        patch memo_url(memo), params: { memo: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested memo" do
      memo = Memo.create! valid_attributes
      expect {
        delete memo_url(memo)
      }.to change(Memo, :count).by(-1)
    end

    it "redirects to the memos list" do
      memo = Memo.create! valid_attributes
      delete memo_url(memo)
      expect(response).to redirect_to(memos_url)
    end
  end
end
