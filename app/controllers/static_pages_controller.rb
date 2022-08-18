class StaticPagesController < ApplicationController
  def home; 
    @books = Book.limit(4)
  end

  def about; end

  def login; end
end
