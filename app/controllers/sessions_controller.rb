class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by Tk: params[:session][:Tk].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect
    else
      flash.now[:danger] = "invalid_TK_password_combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end

  private
  def redirect
    user = current_user
    if user.role != 2
      redirect_to admin_root_path
    else
      redirect_to user
    end
  end
end
