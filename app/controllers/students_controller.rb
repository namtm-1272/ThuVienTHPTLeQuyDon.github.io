class StudentsController < ApplicationController
  def show
    @student = Student.find params[:id]
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      # Handle a successful save.
    else
      render "new"
    end
  end

  def destroy; end

  private

  def student_params
    params.require(:student).permit(:name, :email, :Tk,
                                    :password, :password_confirmation)
  end
end
