class TasksController < ApplicationController
  respond_to :json

  def view
  end

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_with @task
  end

  def destroy
    Task.destroy(params[:id])
    @tasks = Task.all
    respond_with @tasks
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    respond_with @task
  end

  private
    def task_params
      params.fetch(:task, {}).permit(:todo_text, :completed)
    end
end
