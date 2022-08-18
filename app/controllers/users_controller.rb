class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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

  def user_params
    params.required(:user).permit(:Tk, :password, :name, :birthday, :email, :role, :id_lop)
  end
end
