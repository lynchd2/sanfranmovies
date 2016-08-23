class UsersController < ApplicationController
  before_action :current_user, only: [:edit, :show, :update]
  helper UsersHelper
  
  def new
    @user = User.new
    @suffixes = User.suffixes
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def show
    @user = User.find_by_id(params[:id])
    @client = Soda.new
    @results = @client.movies_with_address(@user.street)
  end

  def index
  end

  def update
    if current_user.update(user_params) 
      flash[:success] = "Your stuff has been updated!"
      redirect_to current_user 
    else
      flash[:danger] = "Failed to update your stuff" 
      current_user.errors.full_messages.join(", ")
      redirect_to current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      flash.now[:danger] = "Please fill out all fields and make sure your password and password confirmation match"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :number_street, :street, :street_suffix, :password, :password_confirmation)
  end
end
