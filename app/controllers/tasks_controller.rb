class TasksController < ApplicationController
  respond_to :json
  load_and_authorize_resource

  def index
    respond_with @tasks
  end

  def create
    @task.save
    respond_with @task
  end

  def destroy
    @task.destroy()
    render nothing: true
  end

  def update
    @task.update_attributes(task_params)
    render nothing: true
  end

  private
    def task_params
      params.fetch(:task, {}).permit(:todo_text, :completed)
    end
end
