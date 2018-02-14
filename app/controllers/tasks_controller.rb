require 'date'

class TasksController < ApplicationController
  before_action :set_user

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all.where(user_id: @user.id, active: true)
  end

  # GET /tasks/new
  def new
    @task = @user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    duration_in_seconds = task_params["estimated_duration(4i)"].to_i * 3600 + task_params["estimated_duration(4i)"].to_i * 60
    due_date = DateTime.new(task_params["due_date(1i)"].to_i, 
                        task_params["due_date(2i)"].to_i, 
                        task_params["due_date(3i)"].to_i, 
                        task_params["due_date(4i)"].to_i, 
                        task_params["due_date(5i)"].to_i)
    @task = Task.new(description: task_params["description"], 
                     active: true,
                     priority: task_params["priority"],
                     estimated_duration: duration_in_seconds,
                     due_date: due_date,
                     user_id: @user.id 
                    )

    respond_to do |format|
      if @task.save
        format.html { redirect_to @user, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        flash.now[:error] = @task.errors.full_messages + :user_id
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def complete 
    @task.active? = false
    if @task.update(task_params)
      format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      format.json { render :show, status: :ok, location: @task }
    else
      format.html { render :task }
      format.json { render json: @task.errors, status: :unprocessable_entity }
      end


  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :estimated_duration, :priority, :user_id, :due_date)
    end

    def seconds_to_time(s)
      if (s)
        Time.new(0, 1, 1, (s / 3600).floor, (s % 3600) / 60)    #TODO: make pretty
      end
    end

    def time_to_seconds(t)
      if (t)
        t.hour * 3600 + t.min * 60
      end
    end


end
