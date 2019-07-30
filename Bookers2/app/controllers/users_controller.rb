class UsersController < ApplicationController

   before_action :authenticate_user!,only:[:show,:index,:edit,:destroy ]
   before_action :correct_user, only: [:edit, :update]
  def top
  end

  def show
      @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books
  end

  def index
      @book = Book.new
      @user = User.find(current_user.id)
      @users = User.all
  end



  def edit
    @user = User.find(params[:id])
  end




 def update
      @user = User.find(params[:id])
  if  @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully saved"
  else
      flash[:notice] = "error"
      render :edit
  end
end


  def destroy  
  end

  #def login
   #   @user = User.find_by(name: params[:name], password: params[:password])
  #if  
  #    @user
  #    flash[:notice] = "ログインしました"
  #    redirect_to("/books/index")
  #else
  #    @error_message = "名前またはパスワードが間違っています"
  #    @name = params[:name]
   #   @password = params[:password]   
  #    render("users/top")
  #end

    



  #def ensure_correct_user
  #if 
  #   @current_user.id != params[:id].to_i
  #   flash[:notice] = "権限がありません"
  #   redirect_to("/posts/index")
  #end
 




  def about
  end

  def correct_user
    user  =  User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user)
    end
    
  end

  private



  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
