class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_index = @user.books
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end 

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end 
  end
end
  

