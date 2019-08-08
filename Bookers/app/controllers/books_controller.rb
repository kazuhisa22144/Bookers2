class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :edit_current_user, only: [:edit]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :new_book, only: [:index, :show ,:new,]


  def show
    @book = Book.find(params[:id])
    @user = User.find(@books.user_id)
  end

  def index
    @books = Book.all
  end

  def new
  	
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'Book was successfully created.'
       path_book
    else
      @books = Book.all
      flash[:alert] = "error"
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  if @book.save(book_params)
     redirect_to book_path, notice: 'Book was successfully saved.'
    else
     render :new
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
     redirect_to book_path, notice: 'Book was successfully created.'
    else
     flash[:alert] = "successfully"
     render :edit
    end
  end

 def destroy
    @book = Book.find(params[:id])
    @books = Book.all
    if @book.destroy
     redirect_to books_path, notice: 'Book was successfully deleted.'
    else
     render :new
    end
 end


    def path_book
      redirect_to book_path(@book.id)
    end


    private


    def book_params
      params.require(:book).permit(:title,:body)
    end

    def new_book
      @book = Book.new
    end

    def find_user
      @book = Book.find(params[:id])
    end

    def edit_current_user
      @book = Book.find(params[:id])
    if 
      @book.user_id != current_user.id
      redirect_to books_path
    end
  end
end
