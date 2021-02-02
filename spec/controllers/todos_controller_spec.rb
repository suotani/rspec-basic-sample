require 'rails_helper'


RSpec.describe TodosController, type: :request do

  describe "#index" do
    context "todos blank " do
      it "response success" do
        get "/todos"
        expect(response.status).to eq(200)
      end
    end

    context "todos exist" do
      let!(:todos){create_list(:todo, 3)}
      it "response success" do
        get "/todos"
        expect(response.status).to eq(200)
      end

      it "render todos" do
        get "/todos"
        todos.each do |t|
          expect(response.body).to include t.text
        end
      end
    end
  end
end