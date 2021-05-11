class BooksController < ApplicationController
  def index
    @books = Book.all
    @post = Book.new

  end

  def create
    @post = Book.new(book_params)
     if @post.save
       redirect_to @post,notice: "Book was succesfull created."
     else
       @books = Book.all
       render :index

     end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
    flash[:notice] ="Book was succesfull up."
    redirect_to @book
    else
    render :edit
    end

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