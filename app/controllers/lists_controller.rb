class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:edit, :update, :show, :destroy]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:success] = "List was succesfully created"
      redirect_to list_path(@list)
    else
      flash[:danger] = "Please enter the right params"
      render 'new'
    end
  end

  def update

  end

  def show
  end

  def destroy
    @list.destroy
    flash[:danger] = "The list was successfully deleted"
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
  
  def set_list
    @list = List.find(params[:id])
  end

end
