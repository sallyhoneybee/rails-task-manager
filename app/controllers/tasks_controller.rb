class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.require(:task).permit(:title, :details)
  end

  def update_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
