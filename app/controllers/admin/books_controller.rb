class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
      end

    def new
        @book = Book.new
    end

    def create

    end

    private


  end
