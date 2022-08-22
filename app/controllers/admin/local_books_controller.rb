class Admin::LocalBooksController < Admin::BaseController
  def index
    @q = LocalBook.asc_name.ransack(params[:q])
    @pagy, @local_books = pagy(@q.result, items: 8)
  end

  def new
    @categories = Category.asc_name
    @subjects = Subject.asc_name
    @local_book = LocalBook.new
  end

  def create
    @local_book = LocalBook.new local_book_params
  if @local_book.save
    flash[:success] = "welcome"
    redirect_to admin_local_books_path
  else
    flash[:danger] = "danger"
    render :new
  end
  end

  def edit
    @categories = Category.asc_name
    @subjects = Subject.asc_name
    @local_book = LocalBook.find(params[:id])
  end

  def update
    @local_book = LocalBook.find(params[:id])
    if @local_book.update local_book_params
      flash[:success] = "Profile updated"
      redirect_to admin_local_books_path
    else
      flash[:danger] = "danger"
      render :edit
    end
  end

  def destroy
    @local_book = LocalBook.find_by id: params[:id]
    if @local_book.destroy
      flash[:success] = "success"
    else
      flash[:danger] = "danger"
    end
    redirect_to admin_local_books_path
  end

  private

  def local_book_params
    params.require(:local_book).permit(:id, :code, :name,:poision, :subject_id, :category_id)
  end

end
