class TasksController < ApplicationController
  before_action :task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task
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
    @task
  end

  def update
    @task.update(update_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  private
  def task
    @task = Task.find(params[:id])
  end

  def create_params
    params.require(:task).permit(:title, :details)
  end

  def update_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
