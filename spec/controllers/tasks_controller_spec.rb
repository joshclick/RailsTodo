require 'spec_helper'

describe TasksController do
  include Devise::TestHelpers

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "GET index" do
    it "returns the tasks" do
      FactoryGirl.create_list(:task, 10, user: user)
      get :index, :format => :json
      expect(json.length).to eq(10)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new task" do
        expect{
          post :create, task: FactoryGirl.attributes_for(:task, user: user), :format => :json
        }.to change(Task, :count).by(1)
      end

      it "returns the new task" do
        task = post :create, task: FactoryGirl.attributes_for(:task, user: user), :format => :json
        expect(json.length).to eq(6) # each task has 6 attributes
      end
    end

    context "with invalid attributes" do
      before {
        post :create, task: FactoryGirl.attributes_for(:task, :long_text, user: user), :format => :json
      }

      it "does not create a new task" do
        expect{
          post :create, task: FactoryGirl.attributes_for(:task, :long_text, user: user), :format => :json
        }.to_not change(Task, :count)
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE destroy" do
    it 'destroys the contact' do
      task = FactoryGirl.create(:task, user: user)
      expect{
        delete :destroy, id: task, :format => :json
      }.to change(Task, :count).by(-1)
    end
  end

  describe "PUT update" do
    let(:task) { FactoryGirl.create(:task, user: user) }

    context "with valid attributes" do
      let(:new_text) { task[:todo_text] + 'update' }

      before {
        put :update,
          id: task,
          task: FactoryGirl.attributes_for(:task, todo_text: new_text, user: user),
          :format => :json
        task.reload
      }

      it "changes task's atributes" do
        expect(task.todo_text).to eq(new_text)
      end
    end

    context "with invalid attributes" do
      before {
        put :update,
          id: task,
          task: FactoryGirl.attributes_for(:task, :long_text, user: user),
          :format => :json
        task.reload
      }

      it "does not update task" do
        expect(task.todo_text).to eq(task[:todo_text])
      end
    end
  end

end
