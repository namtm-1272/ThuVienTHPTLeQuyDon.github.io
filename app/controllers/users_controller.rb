class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
  end

  def update
      @user = User.find(update_params[:id])
      if (@user.update(update_params))
        flash[:success] = "Đổi mật khẩu thành công"
        redirect_to users_path
      else
        flash[:alert] = "Không thành công"
        render :new
      end
  end

  private

  def update_params
    params.required(:user).permit(:id, :password, :password_confirmation, :name, :birthday, :email)
  end
end
