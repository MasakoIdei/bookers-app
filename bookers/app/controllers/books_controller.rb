class BooksController < ApplicationController
  def index
    @books = Book.all
    @post = Book.new
    
  end

  def create
    book = Book.new
    book.save
  end
  
  def show
  end

  def edit
  end
end
