require 'rails_helper'


RSpec.describe TodosController, type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

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

  describe "#show" do
    context "target exist" do
      let!(:todo){create(:todo)}

      it "response success" do
        get "/todos/#{todo.id}"
        expect(response.status).to eq(200)
      end

      it "render todo" do
        get "/todos/#{todo.id}"
        expect(response.body).to include todo.text
      end

    end

    context "target un exist" do
      it "response success" do
        expect {
          get "/todos/0"
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#new" do
    it "response success" do
      get "/todos/new"
      expect(response.status).to eq(200)
    end
  end


  describe "#create" do
    context "バリデーションエラー" do
      let(:params) { {todo: {text: ""}} }
      it "response success" do
        post "/todos", params: params
        expect(response.status).to eq(200)
      end

      it "render new" do
        post "/todos", params: params
        expect(response.body).to include "New Todo"
      end

      it "render error" do
        post "/todos", params: params
        expect(response.body).to include "Missing create"
      end
    end

    context "登録成功" do
      let(:todo) {build(:todo)}
      let(:params) { {todo: {text: todo.text, priority: todo.priority}} }
      let(:created_todo) { Todo.last}

      it "response redirect" do
        post "/todos", params: params
        expect(response.status).to redirect_to todo_path(created_todo.id)
      end

      it "response redirect" do
        expect {
          post "/todos", params: params
        }.to change{ Todo.count }.by(1)
      end

    end
  end

  describe "#edit" do
    context "target exist" do
      let!(:todo){create(:todo)}

      it "response success" do
        get "/todos/#{todo.id}/edit"
        expect(response.status).to eq(200)
      end

      it "render todo" do
        get "/todos/#{todo.id}/edit"
        expect(response.body).to include todo.text
      end

    end

    context "target un exist" do
      it "response success" do
        expect {
          get "/todos/0/edit"
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#update" do
    context "更新失敗" do
      let(:todo) {create(:todo)}
      let(:params) { {todo: {text: "", priority: todo.priority}} }

      it "response success" do
        patch "/todos/#{todo.id}", params: params
        expect(response.status).to eq(200)
      end

      it "render edit" do
        patch "/todos/#{todo.id}", params: params
        expect(response.body).to include "Editing Todo"
      end
    end

    context "更新成功" do
      let(:todo) {create(:todo)}
      let(:params) { {todo: {text: todo.text + " updated", priority: todo.priority}} }

      it "response redirect" do
        patch "/todos/#{todo.id}", params: params
        expect(response.status).to redirect_to todo_path(todo.id)
      end

    end
  end

  describe "#destroy" do
    context "削除成功" do
      let!(:todo) {create(:todo)}
      it "delete success" do
        expect {
          delete "/todos/#{todo.id}"
        }.to change{Todo.count}.by(-1)
      end

      it "response redirect" do
        delete "/todos/#{todo.id}"
        expect(response.status).to redirect_to todos_path
      end
    end
  end
end