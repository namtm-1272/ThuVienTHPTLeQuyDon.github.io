class SessionsController < ApplicationController
  def new; end

  def create
    if params[:session][:remember_me] == "0"

      @student = Student.find_by(Tk: params[:session][:Tk].downcase)

      if @student&.authenticate params[:session][:password]
        log_in @student
        redirect_to @student
      else
        flash.now[:danger] = "invalid_email_password_combination"
        render :new
      end
    else
      @admin = Admin.find_by Tk: params[:session][:Tk].downcase
      if @admin&.authenticate params[:session][:password]
        log_in @admin
        redirect_to @admin
      else
        flash.now[:danger] = "invalid_email_password_combination"
        render :new
      end
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end
end
