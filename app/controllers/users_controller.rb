class UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_user
  def index
    @lists = @user.lists
  end


  private
  def set_user
    @user = current_user
  end
end
