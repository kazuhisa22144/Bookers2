class BooksController < ApplicationController
  def show

  	  @Book = Book.find(params[:id])

  end

  def index
  	 @Books = Book.all
  end

  def new
  	@Book = Book.new
  end

  def create
  	@Book = Book.new(Book_params)
    Book.save
    redirect_to path_(book.id)

  end

  def edit
  	@Book = Book.find(params[:id])
  end

 def update
    @Book = Book.find(params[:id])
    Book.update(Book_params)
    redirect_to Book_path(Book.id)

 end

 def destroy
        @Book = Book.find(params[:id])
        blog.destroy
        redirect_to Bookss_path
 end



 private
    def Book_params
        params.require(:Book).permit(:title, :body)
    end

end
