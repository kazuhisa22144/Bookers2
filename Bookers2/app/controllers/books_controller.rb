class BooksController < ApplicationController
 before_action :authenticate_user!,only:[:show,:index,:edit,:destroy ]
 before_action :correct_user, only: [:edit, :update]
  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: "Book was successfully created"
    else
      @books = Book.all
       @user = User.find(current_user.id)
      flash[:notice] = "error"
      render :index
    end
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id),notice: "Book was successfully created"
    else
       flash[:notice] = "error"
       render :edit
    end



  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def correct_user
    book  =  Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to books_path
    end
    
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end