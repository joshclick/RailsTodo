require 'spec_helper'

describe TasksController do

  describe "GET index" do
    it "returns the tasks" do
      FactoryGirl.create_list(:task, 10)
      get :index, :format => :json
      expect(json.length).to eq(10)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new task" do
        expect{
          post :create, task: FactoryGirl.attributes_for(:task), :format => :json
        }.to change(Task, :count).by(1)
      end

      it "returns the new task" do
        task = post :create, task: FactoryGirl.attributes_for(:task), :format => :json
        expect(json.length).to eq(5) # each task has 5 attributes
      end
    end

    context "with invalid attributes" do
      before {
        post :create, task: FactoryGirl.attributes_for(:task_todo_text_long), :format => :json
      }

      it "does not create a new task" do
        expect{
          post :create, task: FactoryGirl.attributes_for(:task_todo_text_long), :format => :json
        }.to_not change(Task, :count)
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE destroy" do
    it 'destroys the contact' do
      @task = FactoryGirl.create(:task)
      expect{
        delete :destroy, id: @task, :format => :json
      }.to change(Task, :count).by(-1)
    end
  end

  describe "PUT update" do
    let(:task) { FactoryGirl.create(:task) }

    context "with valid attributes" do
      let(:new_text) { task[:todo_text] + 'update' }

      before {
        put :update,
          id: task,
          task: FactoryGirl.attributes_for(:task, todo_text: new_text),
          :format => :json
        task.reload
      }

      it "changes task's atributes" do
        expect(task.todo_text).to eq(new_text)
      end

      it { should respond_with 204 }
    end

    context "with invalid attributes" do
      let(:task_todo_text_long) { FactoryGirl.create(:task_todo_text_long) }

      before {
        put :update,
          id: task,
          task: FactoryGirl.attributes_for(:task_todo_text_long),
          :format => :json
        task.reload
      }

      it "does not update task" do
        expect(task.todo_text).to eq(task[:todo_text])
      end

      it { should respond_with 422 }
    end
  end

end
