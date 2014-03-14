class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(todo_text: params[:todo_text])
    if @task.save
      render json: @task
    end
  end

  def delete
    Task.delete(params[:id])
    @tasks = Task.all
    render json: @tasks
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(todo_text: params[:todo_text], completed: params[:completed])
      render json: @task
    end
  end
end
