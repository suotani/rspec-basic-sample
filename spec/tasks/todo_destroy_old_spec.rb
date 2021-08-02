require 'rails_helper'
require 'rake'

RSpec.describe Todo do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/todo'
    Rake::Task.define_task(:environment)
  end

  before(:each) do
    @rake[task].reenable
  end

  describe 'todo:destroy_old' do
    let!(:task){Rake.application['todo:destroy_old']}
    let(:user){create(:user)}

    context "target new and lower priority" do
      let!(:todo1){create(:todo, priority: 1,created_at: Time.zone.today + 1.day, user_id: user.id)}
      it "not destroy" do
        expect{ task.execute() }.to change(Todo, :count).by(0)
      end
    end

    context "target old and lower priority" do
      let!(:todo1){create(:todo, priority: 1,created_at: Time.zone.today - 6.day, user_id: user.id)}
      it "destroy" do
        expect{ task.execute() }.to change(Todo, :count).by(-1)
      end
    end

    context "target old and high priority" do
      let!(:todo1){create(:todo, priority: 2,created_at: Time.zone.today - 6.day, user_id: user.id)}
      it "not destroy" do
        expect{ task.execute() }.to change(Todo, :count).by(0)
      end
    end
  end
end