class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def index
  end
end
