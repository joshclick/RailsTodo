class TasksController < ApplicationController
  respond_to :json
  load_and_authorize_resource

  def index
    @tasks = current_user.tasks.all
    respond_with @tasks
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_with @task
  end

  def destroy
    current_user.tasks.destroy(params[:id])
    @tasks = current_user.tasks.all
    respond_with @tasks
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attributes(task_params)
    respond_with @task
  end

  private
    def task_params
      params.fetch(:task, {}).permit(:todo_text, :completed)
    end
end
