class LocalBooksController < ApplicationController
  def index
    @q = LocalBook.asc_name.ransack(params[:q])
    @pagy, @local_books = pagy(@q.result, items: 8)
  end
end
