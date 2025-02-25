class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => session["user_id"]})
  end

  def create
    if session["user_id"] != nil
    @task = Task.new
    @task["description"] = params["description"]
    @task.save
    redirect_to "/tasks"
    else 
      notice["flash"] = "Login First"
      redirect_to "/tasks"
    end
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
