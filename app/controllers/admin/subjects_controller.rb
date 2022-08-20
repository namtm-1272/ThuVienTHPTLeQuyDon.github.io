class Admin::SubjectsController < Admin::BaseController
  def index
    @q = Subject.asc_name.ransack(params[:q])
    @pagy, @subjects = pagy(@q.result, items: 8)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
  if @subject.save
    flash[:success] = "welcome"
    redirect_to admin_subjects_path
  else
    flash[:danger] = "danger"
    render :new
  end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update subject_params
      flash[:success] = "Profile updated"
      redirect_to admin_subjects_path
    else
      flash[:danger] = "danger"
      render :edit
    end
  end

  def destroy
    @subject = Subject.find_by id: params[:id]
    if @subject.destroy
      flash[:success] = "success"
    else
      flash[:danger] = "danger"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit(:id, :name)
  end

end
