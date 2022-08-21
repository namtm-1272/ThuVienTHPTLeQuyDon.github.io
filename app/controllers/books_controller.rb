class BooksController < ApplicationController
    before_action :logged_in_user, only: [:show]
    BOOKS_PER_PAGE = 8

    def index
        if (params[:sorts]) then
            @sorts = params[:sorts]
            @sorts[":"] = " "
        end
        @page = [params.fetch(:page, 1).to_i, 1].max
        @totalPage = (Book.all.count * 1.0 / BOOKS_PER_PAGE).ceil

        if (!!@sorts && @sorts.length()) then
            @books = Book.order(@sorts).offset((@page - 1) * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
        else
            @books = Book.order("title").offset((@page - 1) * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
        end
    end

    def new
    end

    def search
        @query = params[:q] ? params[:q] : ""
        @totalResult = Book.where("title LIKE ?", "%" + @query + "%").count
        @totalPage = (@totalResult* 1.0 / BOOKS_PER_PAGE).ceil
        @page = [params.fetch(:page, 1).to_i, 1].max
        @books = Book.where("title LIKE ?", "%" + @query + "%").order("title").offset((@page - 1) * BOOKS_PER_PAGE).limit(BOOKS_PER_PAGE)
    end


    def show
        @book = Book.find(params[:id])
    end

  end
