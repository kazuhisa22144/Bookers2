class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :edit_current_user, only: [:edit, :create]
  before_action :new_book, only: [:index, :show]
  before_action :find_user, only: [:show, :edit, :update]


  def show
    @user = User.find(params[:id])
  end


  　　def index
    　　@users = User.all
    end

  def new
    @User = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "error"
      render :edit
    end
  end

  def current_user
      @user=User.find(params[:id])
  end

  def destroy
  @user = User.find(params[:id])
        user.destroy
        redirect_to users_path 
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def new_book
    @book = Book.new
  end

    def edit_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:alert] = "error"
      redirect_to users_path
    end
  





    def user_params
      params.require(:user).permit(:name,:introduction)
    end

end