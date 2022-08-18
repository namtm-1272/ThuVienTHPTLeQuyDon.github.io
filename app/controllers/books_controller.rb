class BooksController < ApplicationController
    BOOKS_PER_PAGE = 4

    def show
        @page = [params.fetch(:page, 1).to_i, 1].max
        @totalPage = (Book.all.length() * 1.0 / BOOKS_PER_PAGE).ceil
        @books = Book.offset((@page - 1) * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
    end

    def new
    end  

  end
  