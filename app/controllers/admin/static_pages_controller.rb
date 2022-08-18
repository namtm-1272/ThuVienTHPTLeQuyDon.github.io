class Admin::StaticPagesController < Admin::BaseController
  def index
  end

  def account_list
  end

  def add_acount
  end

  def book_list
  end

  def add_book
    @book = Book.new
  end

  def create_book
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_root_path
    else
      flash[:alert] = "Something was wrong"
      render :new
    end
  end

  def book_params
    params.required(:book).permit(:title, :content, :author, :subject, :describe, :image, :publish_on)
  end
end
