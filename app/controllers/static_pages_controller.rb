class StaticPagesController < ApplicationController
  def home; 
    @books = Book.order(updated_at: :desc).limit(8)
  end

  def about; end

  def login; end
end
