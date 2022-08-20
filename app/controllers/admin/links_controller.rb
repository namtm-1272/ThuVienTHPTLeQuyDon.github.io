class Admin::LinksController < Admin::BaseController
  def index
    @q = Link.asc_describe.ransack(params[:q])
    @pagy, @links = pagy(@q.result, items: 8)
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new link_params
  if @link.save
    flash[:success] = "welcome"
    redirect_to admin_links_path
  else
    flash[:danger] = "danger"
    render :new
  end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update link_params
      flash[:success] = "Profile updated"
      redirect_to admin_links_path
    else
      flash[:danger] = "danger"
      render :edit
    end
  end

  def destroy
    @link = Link.find_by id: params[:id]
    if @link.destroy
      flash[:success] = "success"
    else
      flash[:danger] = "danger"
    end
    redirect_to admin_links_path
  end

  private

  def link_params
    params.require(:link).permit(:id, :describe, :link)
  end

end
