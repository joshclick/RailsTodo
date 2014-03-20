class TasksController < ApplicationController
  respond_to :json

  def index
    authorize! :index, Task
    @tasks = current_user.tasks.all
    respond_with @tasks
  end

  def create
    authorize! :create, Task
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_with @task
  end

  def destroy
    authorize! :destroy, Task
    current_user.tasks.destroy(params[:id])
    @tasks = current_user.tasks.all
    respond_with @tasks
  end

  def update
    authorize! :update, Task
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes(task_params)
    respond_with @task
  end

  private
    def task_params
      params.fetch(:task, {}).permit(:todo_text, :completed)
    end
end
