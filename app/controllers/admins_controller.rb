class AdminsController < ApplicationController
  def show
    @admin = Admin.find params[:id]
    @pagy, @students = pagy Student.all
    return if @admin

    flash[:warning] = ".not_found"
    redirect_to root_path
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params
    if @student.save
      # Handle a successful save.
    else
      render "new"
    end
  end

  def destroy; end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :Tk,
                                  :password, :password_confirmation)
  end
end
