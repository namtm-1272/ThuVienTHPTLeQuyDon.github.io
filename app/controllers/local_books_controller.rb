class LocalBooksController < ApplicationController
  before_action :logged_in_user
  def index
    @q = LocalBook.asc_name.ransack(params[:q])
    @pagy, @local_books = pagy(@q.result, items: 8)
  end
end
