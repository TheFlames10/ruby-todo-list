class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path, notice: "Task added successfully." }
        format.js   # Renders create.js.erb
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js   # Renders create.js.erb with errors
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: "Task deleted successfully." }
      format.js   # Renders destroy.js.erb
    end
  end

  def edit
    puts @task.inspect
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :priority)
  end
end
