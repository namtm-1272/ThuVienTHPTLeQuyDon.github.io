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
    if update_password[:password] then
      @user = User.find(update_password[:id])
      if (@user.update(update_password))
        redirect_to root_path
      else 
        flash[:alert] = "Something was wrong"
        render :new
      end
    else 
      @user = User.find(update_params[:id])
      if (@user.update(update_params))
        redirect_to root_path
      else 
        flash[:alert] = "Something was wrong"
        render :new
      end
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

  def update_password
    params.required(:user_password).permit(:id, :password)
  end

  def update_params
    params.required(:user).permit(:id, :name, :birthday, :email)
  end

  def user_params
    params.required(:user).permit(:Tk, :password, :name, :birthday, :email, :role, :id_lop)
  end
end
