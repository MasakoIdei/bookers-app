class BooksController < ApplicationController
  def index
    @books = Book.all
    @post = Book.new

  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] ="Book was succesfull created."
    end
    redirect_to book_path(book.id)

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    
    if book.update(book_params)
    flash[:notice] ="Book was succesfull up."
    end
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
       flash[:notice] ="Book was succesfull destroy."
    end
      
    redirect_to books_path
  end




private
def book_params
   params.require(:book).permit(:title, :body)

end

end