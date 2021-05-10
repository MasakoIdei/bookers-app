class BooksController < ApplicationController
   def index
     @books = Book.all
     @post = Book.new
   end

   def create
    　book = Book.new(book_params)
       if book.save
       　flash[:notice] ="Book was succesfull created."
      　 redirect_to book_path(book.id)
       else
      　 render :new
    　 end
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
      redirect_to book_path(book.id)
    else
      render :edit
      end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
       flash[:notice] ="Book was succesfull destroy."
       redirect_to books_path
    end



end




private
  def book_params
   params.require(:book).permit(:title, :body)
  end

end