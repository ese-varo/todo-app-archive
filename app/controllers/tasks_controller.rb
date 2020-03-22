class TasksController < ApplicationController
  before_action :set_list
  def create
    @task = @list.tasks.create(task_params)
    # redirect_to list_path(@list)
    # unless current_page?(controller: 'user', action: 'index')
    # if request.original_url != users_index_path
    #   redirect_to list_path(@list)
    # else
    #   redirect_to users_index_path
    # end
    redirect_to list_path(@list)
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted"
    else
      flash[:error] = "List task could not be deleted"
    end
    redirect_to @list
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params[:task].permit(:title, :content, :pending)
  end
end
