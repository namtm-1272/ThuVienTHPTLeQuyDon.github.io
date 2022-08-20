class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def update
      @user = User.find(update_params[:id])
      if (@user.update(update_params))
        redirect_to users_path
      else
        flash[:alert] = "Something was wrong"
        render :new
      end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      flash[:alert] = "Something was wrong"
      render :new
    end
  end

  def update_params
    params.required(:user).permit(:id, :password, :name, :birthday, :email)
  end

  def user_params
    params.required(:user).permit(:Tk, :password, :name, :birthday, :email, :role, :class_user_id)
  end
end
