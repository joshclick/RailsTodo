require 'spec_helper'

describe TasksController do

  describe "GET index" do
    it "returns the tasks" do
      task = FactoryGirl.create(:task)
      get :index
      assigns(:tasks).should eq([task])
    end
  end

  describe "POST create" do
    it "creates a new task" do
      expect{
        post :create, FactoryGirl.attributes_for(:task)
      }.to change(Task, :count).by(1)
    end

    it "returns the new task"
  end

  describe "DELETE delete" do
    before :each do
      @task = FactoryGirl.create(:task)
    end

    it 'deletes the contact' do
      expect{
        delete :delete, id: @task
      }.to change(Task, :count).by(-1)
    end
  end

  describe "PUT update" do
    before :each do
      @task = FactoryGirl.create(:task)
    end

    it "changes @task's atributes" do
      put :update, id: @task, todo_text: 'newtext'
      @task.reload
      @task.todo_text.should eq('newtext')
    end

    it "returns the updated @task"
  end

end
