class Admin::BooksController < Admin::BaseController
    def index
      @pagy, @books = pagy(Book.all, items: 8)
    end

    def show
      @book = Book.find_by id: params[:id]
    end

    def new
        @book = Book.new
    end

    def update
      @book = Book.find(book_params[:id])
      if (@book.update(book_params))
        flash[:success] = "Successed"
        render "admin/books/show"
      else 
        flash[:alert] = "Something was wrong"
        render "admin/books/show"
      end
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        flash[:success] = "Successed"
        render :new
      else
          flash[:danger] = "No Successed"
          render :new
      end
    end

    def destroy
      @book = Book.find_by id: params[:id]
      if @book.destroy
        flash[:success] = "success"
      else
        flash[:danger] = "danger"
      end
      redirect_to admin_books_path
    end

      private

    def book_params
      params.require(:book).permit(:id, :title, :author,
                                    :subject, :describe, :content, :image, :publish_on)
    end



  end
